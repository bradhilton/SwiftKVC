/*:
# SwiftKVC
Try out SwiftKVC here!
*/
import Foundation
import SwiftKVC

// Create a class or struct that conforms to Model
class User : Model {
    
    var name: String
    var age: Int
    var friends: [User]
    
    init(name: String, age: Int, friends: [User] = []) {
        self.name = name
        self.age = age
        self.friends = friends
    }
    
}

var user = User(name: "Brad", age: 25)

// Use the subscript to set values for keys
user["name"] = "Larry"
print(user.name)

// You can also use the subscript to access values
if let age = user["age"] as? Int {
    print(age)
}
