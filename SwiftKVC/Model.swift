//
//  Model.swift
//  Dynamic
//
//  Created by Bradley Hilton on 7/20/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

/**
    Enables dynamic, KVC-style behavior for native Swift classes and structures.

    Keep in mind the following caveats:
    - All properties must conform to the Property protocol
    - Properties may not be implicitly unwrapped optionals
*/
public protocol Model : Property {}

extension Model {
    
    /** 
        Subscript for getting and setting model properties
    */
    public subscript (key: String) -> Property? {
        get {
            do {
                return try valueForKey(key)
            } catch {
                return nil
            }
        }
        set {
            do {
                try setValue(newValue, forKey: key)
            } catch {
                
            }
        }
    }
    
    public mutating func setValue(_ value: Property?, forKey key: String) throws {
        var offset = 0
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            guard let property = type(of: child.value) as? Property.Type else {
                throw Error.typeDoesNotConformToProperty(type: type(of: child.value))
            }

            if child.label == key {
                try self.codeValue(value, type: type(of: child.value), offset: offset, mirror: mirror)
                return
            } else {
                offset += property.size()
            }
        }
    }
    
    mutating func pointerAdvancedBy(_ offset: Int, mirror: Mirror) -> UnsafePointer<Int> {
        if mirror.displayStyle == .class {
            let selfObj = self as AnyObject
            let selfAddr = Unmanaged.passUnretained(selfObj).toOpaque().hashValue
            return UnsafePointer(bitPattern: selfAddr)!.advanced(by: offset + 2)
        } else {
            return withUnsafePointer(to: &self) { UnsafeRawPointer($0).bindMemory(to: Int.self, capacity: 1).advanced(by: offset) }
        }
    }

    mutating func codeValue(_ value: Property?, type: Any.Type, offset: Int, mirror: Mirror) throws {
        let pointer: UnsafePointer<Int> = pointerAdvancedBy(offset, mirror: mirror)
        if let optionalPropertyType = type as? OptionalProperty.Type, let propertyType = optionalPropertyType.propertyType() {
            if var optionalValue = value {
                try x(optionalValue, isY: propertyType)
                optionalValue.codeOptionalInto(pointer)
            } else if let nilValue = type as? OptionalProperty.Type {
                nilValue.codeNilInto(pointer)
            }
        } else if var sureValue = value {
            try x(sureValue, isY: type)
            sureValue.codeInto(pointer)
        }
    }
    
    func x(_ x: Any, isY y: Any.Type) throws {
        if type(of: x) == y {
        } else if let y = y as? AnyClass, (x as AnyObject).isKind(of: y) {
        } else {
            throw Error.cannotSetTypeAsType(x: type(of: x), y: y)
        }
    }
    
    public func valueForKey(_ key: String) throws -> Property? {
        var value: Property?
        for child in Mirror(reflecting: self).children {
            if child.label == key && String(describing: child.value) != "nil" {
                if let property = child.value as? OptionalProperty {
                    value = property.property()
                } else if let property = child.value as? Property {
                    value = property
                } else {
                    throw Error.typeDoesNotConformToProperty(type: type(of: child.value))
                }
                break
            }
        }
        return value
    }
    
}
