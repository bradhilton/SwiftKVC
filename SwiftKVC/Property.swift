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
        return Int(ceil(Double(MemoryLayout<Self>.size)/Double(MemoryLayout<Int>.size)))
    }
    
    static func type() -> Self.Type.Type {
        return type(of: self)
    }
    
    mutating func codeInto(_ pointer: UnsafePointer<Int>) {
        let ptr = UnsafeMutableRawPointer(mutating: pointer).bindMemory(to: Self.self, capacity: 1)
        ptr.pointee = self
    }
    
    mutating func codeOptionalInto(_ pointer: UnsafePointer<Int>) {
        let ptr = UnsafeMutableRawPointer(mutating: pointer).bindMemory(to: Optional<Self>.self, capacity: 1)
        ptr.pointee = self
    }

}

protocol OptionalProperty : Property {
    static func codeNilInto(_ pointer: UnsafePointer<Int>)
    static func propertyType() -> Property.Type?
    func property() -> Property?
}

extension Optional : OptionalProperty {
    
    static func codeNilInto(_ pointer: UnsafePointer<Int>) {
        let ptr = UnsafeMutableRawPointer(mutating: pointer).bindMemory(to: Optional<Wrapped>.self, capacity: 1)
        ptr.pointee = nil
    }
    
    static func propertyType() -> Property.Type? {
        return Wrapped.self as? Property.Type
    }
    
    func property() -> Property? {
        switch self {
        case .some(let property):
            if let property = property as? Property {
                return property
            } else {
                return nil
            }
        default: return nil
        }
    }
    
}


