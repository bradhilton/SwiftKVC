# SwiftKVC

`SwiftKVC` brings key-value coding to native Swift classes and structures. You can easily set and access properties just using a subscript:
```swift
var person = Person()
person["name"] = "John"
```
Or use the more verbose method to catch potential errors:
```swift
var person = Person()
do {
  try person.setValue("John", forKey:"name")
} catch {
  print(error)
}
```
`SwiftKVC` brings the power of Cocoa style key-value coding to Swift.

## Installation

`SwiftKVC` is available through [CocoaPods](http://cocoapods.org). To install, simply include the following lines in your podfile:
```ruby
use_frameworks!
pod 'SwiftKVC'
```
Be sure to import the module at the top of your .swift files:
```swift
import SwiftKVC
```
Alternatively, clone this repo or download it as a zip and include the classes in your project.

## Usage

To enable key-value coding for a native Swift structure or class, simply have it conform to the protocol `Model`:
```swift
extension Person : Model {}
```
You can then set and retrieve values from your model by key:
```swift
person["name"] = "John"
person["age"] = 36
if let id = person["id"] as? Int {
  print(id)
}
```
If you would like to handle possible errors, you can use the more verbose methods:
```swift
do {
  try person.setValue("John", forKey: "name")
  try person.setValue(36, forKey: "age")
  if let id = try person.valueForKey("id") as? Int {
    print(id)
  }
} catch {
  print(error)
}
```
Be aware that every one of your model's properties must conform to the protocol `Property` like so:
```swift
extension MyCustomType : Property {}
```
Implicitly unwrapped optional properties will not work properly and should be avoided:
```swift
struct User : Model {
  var id: String
  var email: String! // Will not work as expected and may result in a fatal error if set or accessed
}
```
There is another caveat when using classes. If your class inherits from a superclass with private properties, `SwiftKVC` will not work as expected and may fail.
## Author

Brad Hilton, brad@skyvive.com

## License

`SwiftKVC` is available under the MIT license. See the LICENSE file for more info.
