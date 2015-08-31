//
//  Error.swift
//  Dynamic
//
//  Created by Bradley Hilton on 8/28/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

public enum Error : ErrorType, CustomStringConvertible {
    case ModelCannotBeClass(type: Any.Type)
    case TypeDoesNotConformToProperty(type: Any.Type)
    public var description: String {
        switch self {
        case .ModelCannotBeClass(type: let type): return "Model cannot be a class. Try changing the definition of \(type) to a struct."
        case .TypeDoesNotConformToProperty(type: let type): return "\(type) does not conform to Dynamic.Property."
        }
    }
}
