//
//  Model.swift
//  Dynamic
//
//  Created by Bradley Hilton on 7/20/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

import Reflection

/// Enables dynamic, KVC-style behavior for native Swift structures.
public protocol Value {}

extension Value {
    
    /// Subscript for getting and setting value properties.
    /// Handles failure silently.
    public subscript (key: String) -> Any? {
        get {
            return try? get(key: key)
        }
        set {
            _ = try? set(value: newValue as Any, key: key)
        }
    }
    
    /// Get value for key; may throw Reflection error.
    public func get(key: String) throws -> Any {
        return try Reflection.get(key, from: self)
    }
    
    /// Set value for key; may throw Reflection error.
    public mutating func set(value: Any, key: String) throws {
        try Reflection.set(value, key: key, for: &self)
    }
    
}

/// Enables dynamic, KVC-style behavior for native Swift classes.
public protocol Object : class {}

extension Object {
    
    /// Subscript for getting and setting object properties.
    /// Handles failure silently.
    public subscript (key: String) -> Any? {
        get {
            return try? get(key: key)
        }
        set {
            _ = try? set(value: newValue as Any, key: key)
        }
    }
    
    /// Get value for key; may throw Reflection error.
    public func get(key: String) throws -> Any {
        return try Reflection.get(key, from: self)
    }
    
    /// Set value for key; may throw Reflection error.
    public func set(value: Any, key: String) throws {
        try Reflection.set(value, key: key, for: self)
    }
    
}
