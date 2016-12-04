//
//  SwiftKVCTests.swift
//  SwiftKVCTests
//
//  Created by Bradley Hilton on 8/31/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//

import XCTest
import Reflection
import SwiftKVC

class SwiftKVCTests: XCTestCase {
    
    var john: Person {
        return Person(firstName: "John", lastName: "Smith", age: 45)
    }
    
    var jacob: Person {
        return Person(firstName: "Jacob", middleName: "Tyler", lastName: "Smith", age: 36, friends: [jack, jane], bestFriend: jane)
    }
    
    var jack: Person {
        return Person(firstName: "Jack", lastName: "Smith", age: 51)
    }
    
    var jane: Person {
        return Person(firstName: "Jane", lastName: "Smith", age: 23)
    }
    
    func testPerson() {
        let person = john
        assert(person: john, sameAsPerson: person)
        person["firstName"] = jacob.firstName
        person["middleName"] = jacob.middleName
        person["lastName"] = jacob.lastName
        person["age"] = jacob.age
        person["friends"] = jacob.friends
        person["bestFriend"] = jacob.bestFriend
        assert(person: jacob, sameAsPerson: person)
    }
    
    func testNullabilty() {
        let person = john
        XCTAssert(person.middleName == nil)
        person["middleName"] = "Jacob"
        XCTAssert(person.middleName == "Jacob")
        person["middleName"] = nil
        XCTAssert(person.middleName == nil)
        person["firstName"] = nil
        XCTAssert(person.firstName == john.firstName)
    }
    
    func assert(person lh: Person, sameAsPerson rh: Person) {
        XCTAssert(lh.firstName == rh["firstName"] as? String)
        XCTAssert(lh.middleName == rh["middleName"] as? String)
        XCTAssert(lh.lastName == rh["lastName"] as? String)
        XCTAssert(lh.age == rh["age"] as? Int)
        XCTAssert(lh.friends == rh["friends"] as! [Person])
        XCTAssert(lh.bestFriend == rh["bestFriend"] as? Person)
    }
    
    func testThrowingMethods() {
        do {
            let person = john
            XCTAssert(try person.get(key: "firstName") as? String == john.firstName)
            try person.set(value: "Jacob", key: "middleName")
            XCTAssert(try person.get(key: "middleName") as? String == "Jacob")
            try person.set(value: Optional<String>.none as Any, key: "middleName")
            XCTAssert(try person.get(key: "middleName") as? String == nil)
        } catch {
            XCTFail(String(describing: error))
        }
        do {
            let person = john
            _ = try person.get(key: "unknownKey")
            XCTFail("Should throw error")
        } catch ReflectionError.instanceHasNoKey {
        } catch {
            XCTFail(String(describing: error))
        }
    }
    
}

class Person : Object, Equatable {
    
    var firstName: String
    var middleName: String?
    var lastName: String
    var age: Int
    var friends: [Person]
    var bestFriend: Person?
    
    var fullName: String {
        return firstName + (middleName != nil ? " \(middleName!) " : " ") + lastName
    }
    
    init(firstName: String, middleName: String? = nil, lastName: String, age: Int, friends: [Person] = [], bestFriend: Person? = nil) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.age = age
        self.friends = friends
        self.bestFriend = bestFriend
    }
    
}

func == (lh: Person, rh: Person) -> Bool {
    return lh.fullName == rh.fullName
}
