import Foundation

internal protocol OptionalProtocol {
    static var wrappedType: Any.Type { get }
}

extension Optional: OptionalProtocol {
    static var wrappedType: Any.Type {
        return Wrapped.self
    }
}

internal protocol DefaultProtocolValue {
    var isNil: Bool { get }
}

extension Optional: DefaultProtocolValue {
    var isNil: Bool {
        return self == nil
    }
}

