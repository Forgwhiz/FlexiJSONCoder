![Static Badge](https://img.shields.io/badge/Platform-iOS-blue)
![Static Badge](https://img.shields.io/badge/iOS-13.0%2B-orange)
![Static Badge](https://img.shields.io/badge/SwiftPM-Compatible-green)
![Static Badge](https://img.shields.io/badge/pod-v0.0.6-blue)
![Static Badge](https://img.shields.io/badge/Licence-MIT-black)
![Static Badge](https://img.shields.io/badge/OpenSource-red)
![Static Badge](https://img.shields.io/badge/Swift%20Tests-passing-green?logo=github&link=image)


# FlexiJSONCodable for Swift

**FlexiJSONCodable** is a lightweight, flexible, and easy-to-use library for decoding JSON data into Swift types, providing **type coercion** with fallback support. It allows you to seamlessly handle different data types coming from a JSON response and automatically convert them to the expected types in your model. 

This library is especially useful when dealing with API responses that may contain multiple types for a single field (e.g., `String`, `Int`, `Float`, `Double`, etc.), making it easier to work with inconsistent data structures.


> [!IMPORTANT]
> The current version is still in development. There may be breaking changes in version updates until version 1.0.

## Features:

- **Type Coercion with Fallback**: Automatically convert `String`, `Int`, `Float`, `Double`, and `Bool` types to your model's expected type.
- **Flexible Data Handling**: Coerce data from different types (e.g., `"true"` string to `Bool`, `"1"` string to `Int`, etc.).
- **Error Handling**: Throws clear errors if the type conversion fails, ensuring data integrity.
- **Easy Integration**: Seamless integration with your existing Swift codebase using the standard `Decodable` protocol.
- **Customizable for Future Types**: Easily extendable to support other types like `Date`, `URL`, etc.

## Supported Datatypes :
**Version 0.0.6**: This release with support for `String`, `Int`, `Float`, `Double`, and `Bool` coercion.

## Installation

FlexiJSONCodable is available through [Swift Package Manager](https://swiftpackageindex.com/Forgwhiz/FlexiJSONCodable)

## Features <a id='ssFeatures'></a>

### Swift Package Manager

- In Xcode select:

```ruby
File > Swift Packages > Add Package Dependency...
```
- Then paste this URL:

```ruby
https://github.com/Forgwhiz/FlexiJSONCodable.git
```

### Cocoapods

Add the following line to your `Podfile`:

```ruby
pod 'FlexiJSONCodable', '~> 0.0.6'
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

Usage of the library is simple and can be seen in the example provided below. Here's how to use **FlexiJSONCodable** in your Swift model:

```swift
struct WelcomeModel: FlexiJSONCodable {
    let id: String?
    let title: String
    let type: Int?
    let category: Float?
    let isActive: Bool?
}

let jsonData = """
{
    "id": "123",
    "title": "Welcome",
    "type": "1",
    "category": "45.67",
    "isActive": "true",
}
""".data(using: .utf8)!

do {
    let decodedModel = try JSONDecoder().decode(WelcomeModel.self, from: jsonData)
    print(decodedModel)  // Outputs: WelcomeModel(id: "123", title: "Welcome", type: 1, category: 45.67, isActive: true)
} catch {
    print("Decoding failed: \(error)")
}
```

### Options for Custom Types

While the basic functionality works out of the box for `String`, `Int`, `Float`, `Double`, and `Bool`, you can extend the functionality in the future as needed. **FlexiJSONCodable** is built with extensibility in mind.

### Supported Types

| Command | Description |
| --- | --- |
| `String` | Can be converted from `String`, `Int`, `Float`, `Double` |
| `Int` | Can be converted from `String`, `Float`, `Double` |
| `Float` | Can be converted from `String`, `Int`, `Double` |
| `Double` | Can be converted from `String`, `Int`, `Float` |
| `Bool` | Can be converted from `String` ("true"/"false") or `Int` (1 for `true`, 0 for `false`) |


### Customizing for Future Types

You can extend the library to support additional types (like `Date`, `URL`, etc.) by adding new `decodeWithFallback` functions for each type.

## License

**FlexiJSONCodable** is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

---
