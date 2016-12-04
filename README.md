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
  try person.set(value: "John", key: "name")
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

To enable key-value coding for a native Swift structure or class, simply have it conform to either `Value` or `Object` respectively:
```swift
struct Person : Value {
  var name: String
  var age: Int
}
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
  try person.set(value: "John", key: "name")
  try person.set(value: 36, key: "age")
  if let id = try person.get(key: "id") as? Int {
    print(id)
  }
} catch {
  print(error)
}
```
## Author

Brad Hilton, brad@skyvive.com

## License

`SwiftKVC` is available under the MIT license. See the LICENSE file for more info.
