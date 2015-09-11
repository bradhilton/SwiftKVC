//
//  SwiftKVCTests.swift
//  SwiftKVCTests
//
//  Created by Bradley Hilton on 8/31/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

import XCTest
import SwiftKVC

class SwiftKVCTests: XCTestCase {
    
    func testExample() {
        var user = User()
        print(user.name)
        user["name"] = "Larry"
        print(user.name)
        var transaction = Transaction()
        do {
            try transaction.setValue(NSDate(), forKey: "date")
        } catch {
            print(error)
        }
        do {
            try transaction.setValue(Currency.BitCoin, forKey: "currency")
        } catch {
            print(error)
        }
    }
    
}

class User : Model {
    var name = "Brad"
    var age = 26
    var transactions = [Transaction]()
}

struct Transaction : Model {
    var total: Double = 0
    var currency = Currency.USDollar
    var date: NSDate = NSDate(timeIntervalSinceReferenceDate: 0.0)
}

enum Currency : String, Property {
    
    case USDollar = "USDollar"
    case BitCoin = "BitCoin"
    case Quint = "Quint"
    case GoldDollar = "GoldDollar"
    case SilverDollar = "SilverDollar"
    case PlatinumDollar = "PlatinumDollar"
    case Gold = "Gold"
    
}
