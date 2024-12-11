![Static Badge](https://img.shields.io/badge/Platform-iOS-blue)
![Static Badge](https://img.shields.io/badge/iOS-13.0%2B-orange)
![Static Badge](https://img.shields.io/badge/SwiftPM-Compatible-green)
![Static Badge](https://img.shields.io/badge/pod-v0.0.1-blue)
![Static Badge](https://img.shields.io/badge/Licence-MIT-black)
![Static Badge](https://img.shields.io/badge/OpenSource-red)
![Static Badge](https://img.shields.io/badge/Swift%20Tests-passing-green?logo=github&link=image)


# FlexiJSONCoder for Swift

**FlexiJSONCoder** is a lightweight, flexible, and easy-to-use library for decoding JSON data into Swift types, providing **type coercion** with fallback support. It allows you to seamlessly handle different data types coming from a JSON response and automatically convert them to the expected types in your model. 

This library is especially useful when dealing with API responses that may contain multiple types for a single field (e.g., `String`, `Int`, `Float`, `Double`, etc.), making it easier to work with inconsistent data structures.


## Features:

- **Default Value Handling**: Automatically applies default values for any missing keys or values in the JSON.
- **Type Coercion**: Converts incoming data types (e.g., String, Int, Float, Double, Bool) to the model's expected type seamlessly.
- **Null Value Management**: Replaces null values with predefined default values, ensuring smooth processing.
- **Data Integrity**: Generates clear and actionable errors for unsupported type conversions while maintaining data consistency.
- **Easy Integration**: Compatible with your existing Swift codebase and leverages the Decodable protocol.
- **Customizable**: Supports extensions for additional data types, such as Date, URL, and more, for future-proof development

## Supported Datatypes :
**Version 0.0.1**: This release with support for `String`, `Int`, `Float`, `Double`, and `Bool` coercion.

## Installation

FlexiJSONCoder is available through [Swift Package Manager](https://swiftpackageindex.com/Forgwhiz/FlexiJSONCoder)

## Features <a id='ssFeatures'></a>

### Swift Package Manager

- In Xcode select:

```ruby
File > Swift Packages > Add Package Dependency...
```
- Then paste this URL:

```ruby
https://github.com/Forgwhiz/FlexiJSONCoder.git
```

### Cocoapods

Add the following line to your `Podfile`:

```ruby
pod 'FlexiJSONCoder', '~> 0.0.1'
```

Then run:

```bash
pod install
```

or

```bash
pod update
```


## Demo

### Basic Usage

Usage of the library is simple and can be seen in the example provided below. Here's how to use **FlexiJSONCoder** in your Swift model:

```swift

import FlexiJSONCoder

struct WelcomeModel: Codable {
    let id: String?
    let title: String
    let type: Int?
    let category: Float?
}

let jsonData = """
{
    "id": "123",
    "title": "Welcome",
    "category": "45.67",
    "isActive": "true",
}
""".data(using: .utf8)!

do {
    let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [.fragmentsAllowed])
    let decodedModel = try FlexiJsonDecoder().decode(WelcomeModel.self, from: jsonData)
    print(decodedModel)  // Outputs: WelcomeModel(id: "123", title: "Welcome", type: 0, category: 45.67, isActive: true)
} catch {
    print("Decoding failed: \(error)")
}
```

### Options for Custom Types

While the basic functionality works out of the box for `String`, `Int`, `Float`, `Double`, and `Bool`, you can extend the functionality in the future as needed. **FlexiJSONCoder** is built with extensibility in mind.

### Supported Types

| Command | Description |
| --- | --- |
| `String` | Can be converted from `String`, `Int`, `Float`, `Double` |
| `Int` | Can be converted from `String`, `Float`, `Double` |
| `Float` | Can be converted from `String`, `Int`, `Double` |
| `Double` | Can be converted from `String`, `Int`, `Float` |
| `Bool` | Can be converted from `String` ("true"/"false") or `Int` (1 for `true`, 0 for `false`) |


### Customizing for Future Types

You can extend the library to support additional types (like `Date`, `URL`, etc.)

## License

**FlexiJSONCoder** is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

---
