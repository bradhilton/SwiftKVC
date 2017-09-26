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

class SubUser : User {
    
    var email: String
    
    init(name: String, age: Int, email: String) {
        self.email = email
        super.init(name: name, age: age)
    }
    
}

let user = User(name: "Brad", age: 25)
user["name"] = "Larry"
assert(user["age"] as? Int == 25)
assert(user.name == "Larry")

let subUser = SubUser(name: "Jerry", age: 59, email: "jerry@face.com")
subUser["email"] = "jerry@live.com"
assert(subUser["email"] as? String == "jerry@live.com")
// Doesn't work:
// subUser["age"] = 60
// assert(subUser["age"] as? Int == 60)
