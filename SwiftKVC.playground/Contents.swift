/*:
# SwiftKVC
Try out SwiftKVC here!
*/
import Foundation
import SwiftKVC

class User : Object {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

let user = User(name: "Brad", age: 25)
user["name"] = "Larry"
assert(user["age"] as? Int == 25)
assert(user.name == "Larry")
