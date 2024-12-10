import Foundation

extension FlexiJSONCoder {

    /// Handles `dataCorrupted` errors
    internal func handleDataCorrupted(_ context: DecodingError.Context) {
        print("Data Corrupted Error:")
        print("Coding Path: \(context.codingPath)")
        print("Debug Description: \(context.debugDescription)")
    }

    /// Handles `keyNotFound` errors
    internal  func handleKeyNotFound<T: Decodable>(
        _ type: T.Type,
        key: CodingKey,
        context: DecodingError.Context,
        data: Data
    ) throws -> T? {
        print("Key Not Found Error:")
        print("Missing Key: \(key.stringValue)")
        print("Coding Path: \(context.codingPath)")
        print("Debug Description: \(context.debugDescription)")

        if var jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            jsonObject[key.stringValue] = NSNull()
            let flexiJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.fragmentsAllowed])
            return try self.decode(T.self, from: flexiJsonData)
        }
        return nil
    }

    /// Handles `typeMismatch` errors
    internal func handleTypeMismatch<T: Decodable>(
        _ expectedType: Any.Type,
        context: DecodingError.Context,
        data: Data
    ) throws -> T? {
        print("Type Mismatch Error:")
        print("Type: \(expectedType)")

        guard let problematicKey = context.codingPath.last?.stringValue else {
            print("Could not determine the problematic key.")
            throw DecodingError.typeMismatch(expectedType, context)
        }

        if var jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let problematicValue = jsonObject[problematicKey],
           let convertedValue = convertValue(problematicValue, to: expectedType) {
            jsonObject[problematicKey] = convertedValue

            let flexiJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.fragmentsAllowed])
            return try self.decode(T.self, from: flexiJsonData)
        }
        return nil
    }

    /// Handles `valueNotFound` errors
    internal func handleValueNotFound<T: Decodable>(
        _ type: T.Type,
        value: Any.Type,
        context: DecodingError.Context,
        data: Data
    ) throws -> T? {
        print("Value Not Found Error:")
        print("Missing Value: \(value)")
        print("Coding Path: \(context.codingPath)")
        print("Debug Description: \(context.debugDescription)")

        if var jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let incomingKey = context.codingPath.last?.stringValue {
            jsonObject[incomingKey] = getDefaultValue(for: value)
            let flexiJsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.fragmentsAllowed])
            return try self.decode(T.self, from: flexiJsonData)
        }
        return nil
    }
}

