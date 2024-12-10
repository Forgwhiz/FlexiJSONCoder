import Foundation

public class FlexiJSONCoder {
    
    public init() {}
    
    fileprivate var flexiData: Data? = nil
    
    /// Decodes JSON data into a model of type `T`
    /// - Parameters:
    ///   - type: The type of model to decode
    ///   - data: The JSON data to decode
    /// - Returns: Decoded model of type `T`
    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T? {
        do {
            flexiData = data
            let decodedModel = try JSONDecoder().decode(T.self, from: data)
            return decodedModel
        } catch let DecodingError.dataCorrupted(context) {
            handleDataCorrupted(context)
        } catch let DecodingError.keyNotFound(key, context) {
            return try handleKeyNotFound(type, key: key, context: context, data: data)
        } catch let DecodingError.typeMismatch(type, context) {
            return try handleTypeMismatch(type, context: context, data: data)
        } catch let DecodingError.valueNotFound(value, context) {
            return try handleValueNotFound(type, value: value, context: context, data: data)
        } catch {
            print("General Decoding Error: \(error)")
            return nil
        }
        return nil
    }
    
    /// Encodes JSON data into a model of type `T`
    /// - Parameters:
    ///   - type: The type of model to encode
    /// - Returns: Encoded data`
    public func encode<T: Encodable>(_ value: T) throws -> Data? {
        do {
            let encodedData = try JSONEncoder().encode(value)
            return encodedData
        } catch let EncodingError.invalidValue(value, context) {
            print("Encoding Error - Invalid Value: \(value)")
            print("Context: \(context.debugDescription)")
            print("Coding Path: \(context.codingPath)")
        } catch {
            print("General Encoding Error: \(error)")
            return nil
        }
        return nil
    }
    
}

