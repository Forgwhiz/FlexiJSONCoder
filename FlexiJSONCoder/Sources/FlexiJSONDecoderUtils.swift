import Foundation

extension FlexiJSONCoder {
    
    /// Gets the default value for a given type
 
    internal func getDefaultValue(for type: Any.Type) -> Any {
       
        if let optionalType = type as? OptionalProtocol.Type {
            return optionalType.wrappedType
        }

        // Handle non-optional types
        switch type {
        case is Int.Type:
            return 0
        case is String.Type:
            return ""
        case is Bool.Type:
            return false
        case is Double.Type:
            return 0.0
        case is Float.Type:
            return 0.0
        case is [Any].Type:
            return []
        case is [String: Any].Type:
            return [:]
        default:
            return NSNull()
        }
    }
    
    /// Converts a value to the expected type
    internal func convertValue(_ value: Any, to expectedType: Any.Type) -> Any? {
        let unwrappedType = getWrappedType(from: expectedType) ?? expectedType
        
        switch unwrappedType {
        case is String.Type:
            if let stringValue = value as? String {
                return stringValue
            } else if let integerValue = value as? Int {
                return String(integerValue)
            } else if let int64Value = value as? Int64 {
                return String(int64Value)
            } else if let uint64Value = value as? UInt64 {
                return String(uint64Value)
            } else if let doubleValue = value as? Double {
                return String(doubleValue)
            } else if let floatValue = value as? Float {
                return String(floatValue)
            } else {
                return ""
            }
        case is Int.Type:
            if let intValue = value as? Int {
                return intValue
            } else if let int64Value = value as? Int64 {
                return Int(exactly: int64Value)
            } else if let uint64Value = value as? UInt64 {
                return Int(exactly: uint64Value)
            } else if let stringValue = value as? String {
                return Int(stringValue)
            } else if let doubleValue = value as? Double {
                return Int(doubleValue)
            } else {
                return 0
            }
        case is Double.Type:
            if let doubleValue = value as? Double {
                return doubleValue
            } else if let stringValue = value as? String {
                return Double(stringValue)
            } else if let intValue = value as? Int {
                return Double(intValue)
            } else if let floatValue = value as? Float {
                return Double(floatValue)
            } else {
                return 0.0
            }
        case is Float.Type:
            if let floatValue = value as? Float {
                return floatValue
            } else if let stringValue = value as? String {
                return Float(stringValue)
            } else if let intValue = value as? Int {
                return Float(intValue)
            } else if let doubleValue = value as? Double {
                return Float(doubleValue)
            } else {
                return 0.0
            }
        case is Bool.Type:
            if let boolValue = value as? Bool {
                return boolValue
            } else if let stringValue = value as? String {
                let lowercasedValue = stringValue.lowercased()
                if lowercasedValue == "true" || lowercasedValue == "1" {
                    return true
                } else if lowercasedValue == "false" || lowercasedValue == "0" {
                    return false
                }
            } else if let intValue = value as? Int {
                return intValue == 1
            } else if let int64Value = value as? Int64 {
                return int64Value == 1
            } else if let uint64Value = value as? UInt64 {
                return uint64Value == 1
            } else if let doubleValue = value as? Double {
                return doubleValue == 1.0
            } else if let floatValue = value as? Float {
                return floatValue == 1.0
            } else {
                return false  // Or you can return a custom string or value to represent null
            }
            
        default:
            return nil
        }
        return nil
    }
    
    /// Extracts the wrapped type from an Optional type
    internal func getWrappedType(from type: Any.Type) -> Any.Type? {
        (type as? OptionalProtocol.Type)?.wrappedType
    }
}
