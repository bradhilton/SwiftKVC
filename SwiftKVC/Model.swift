//
//  Model.swift
//  Dynamic
//
//  Created by Bradley Hilton on 7/20/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

/**
    Enables dynamic, KVC-style behavior for native Swift structures.

    Keep in mind the following caveats:
    - Model must be a struct (i.e., not a class or enum)
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
            _ = try? setValue(newValue, forKey: key)
        }
    }
    
    public mutating func setValue(value: Property?, forKey key: String) throws {
        guard (self as? AnyObject) == nil else { throw Error.ModelCannotBeClass(type: self.dynamicType) }
        var offset = 0
        for child in Mirror(reflecting: self).children {
            guard let property = child.value.dynamicType as? Property.Type else { throw Error.TypeDoesNotConformToProperty(type: child.value.dynamicType) }
            if child.label == key {
                self.codeValue(value, withMirror: child, atOffset: offset)
                return
            } else {
                offset += property.size()
            }
        }
    }
    
    mutating func codeValue(value: Property?, withMirror child: Mirror.Child, atOffset offset: Int) {
        withUnsafePointer(&self) { (ptr) -> () in
            let pointer = UnsafePointer<Int64>(ptr).advancedBy(offset)
            if let optionalPropertyType = child.value.dynamicType as? OptionalProperty.Type, let propertyType = optionalPropertyType.propertyType() {
                if var optionalValue = value where x(optionalValue, isY: propertyType) {
                    optionalValue.codeOptionalInto(pointer)
                } else if let nilValue = child.value.dynamicType as? OptionalProperty.Type {
                    nilValue.codeNilInto(pointer)
                }
            } else if var sureValue = value where x(sureValue, isY: child.value.dynamicType) {
                sureValue.codeInto(pointer)
            }
        }
    }
    
    func x(x: Any, isY y: Any.Type) -> Bool {
        if x.dynamicType == y {
            return true
        } else if let x = x as? AnyObject, let y = y as? AnyClass where x.isKindOfClass(y) {
            return true
        } else {
            return false
        }
    }
    
    public func valueForKey(key: String) throws -> Property? {
        var value: Property?
        for child in Mirror(reflecting: self).children {
            if child.label == key && String(child.value) != "nil" {
                if let property = child.value as? OptionalProperty {
                    value = property.property()
                } else if let property = child.value as? Property {
                    value = property
                } else {
                    throw Error.TypeDoesNotConformToProperty(type: child.value.dynamicType)
                }
                break
            }
        }
        return value
    }
    
}