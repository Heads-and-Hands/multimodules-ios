import Foundation

public struct ApiClientHTTPMethod: RawRepresentable, Equatable, Hashable {

    public static let post = ApiClientHTTPMethod(rawValue: "POST")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
