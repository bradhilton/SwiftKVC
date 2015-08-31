//
//  Property.swift
//  Dynamic
//
//  Created by Bradley Hilton on 7/20/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

/// All model properties must conform to this protocol
public protocol Property {}

extension Property {
    
    static func size() -> Int {
        return Int(ceil(Double(sizeof(self))/8))
    }
    
    static func type() -> Self.Type.Type {
        return self.dynamicType
    }
    
    mutating func codeInto(pointer: UnsafePointer<Int64>) {
        (UnsafeMutablePointer(pointer) as UnsafeMutablePointer<Self>).memory = self
    }
    
    mutating func codeOptionalInto(pointer: UnsafePointer<Int64>) {
        (UnsafeMutablePointer(pointer) as UnsafeMutablePointer<Optional<Self>>).memory = self
    }

}

protocol OptionalProperty : Property {
    static func codeNilInto(pointer: UnsafePointer<Int64>)
    static func propertyType() -> Property.Type?
    func property() -> Property?
}

extension Optional : OptionalProperty {
    
    static func codeNilInto(pointer: UnsafePointer<Int64>) {
        (UnsafeMutablePointer(pointer) as UnsafeMutablePointer<Optional>).memory = nil
    }
    
    static func propertyType() -> Property.Type? {
        return Wrapped.self as? Property.Type
    }
    
    func property() -> Property? {
        switch self {
        case .Some(let property):
            if let property = property as? Property {
                return property
            } else {
                return nil
            }
        default: return nil
        }
    }
    
}


