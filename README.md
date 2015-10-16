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
`SwiftKV`C brings the power of Cocoa style key-value coding to Swift.

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

## Author

Brad Hilton, brad@skyvive.com

## License

`SwiftKVC` is available under the MIT license. See the LICENSE file for more info.
