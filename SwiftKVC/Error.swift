//
//  Error.swift
//  Dynamic
//
//  Created by Bradley Hilton on 8/28/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

public enum Error : ErrorType, CustomStringConvertible {
    case TypeDoesNotConformToProperty(type: Any.Type)
    case CannotSetTypeAsType(x: Any.Type, y: Any.Type)
    public var description: String {
        switch self {
        case .TypeDoesNotConformToProperty(type: let type): return "\(type) does not conform to SwiftKVC.Property."
        case .CannotSetTypeAsType(x: let x, y: let y): return "Cannot set value of type \(x) as \(y)."
        }
    }
}
