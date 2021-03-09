import Foundation

public protocol ApiClientConfiguration {
    var serverHost: String { get }
    var debugMode: Bool { get }
}
