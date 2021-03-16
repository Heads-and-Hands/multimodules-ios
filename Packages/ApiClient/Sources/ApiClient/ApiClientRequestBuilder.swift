import Foundation

public class ApiClientRequestBuilder {

    private let configuration: ApiClientConfiguration
    private let jsonEncoder: JSONEncoder

    init(configuration: ApiClientConfiguration) {
        self.configuration = configuration
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        self.jsonEncoder = encoder
        // add support for other methods and plugins
    }

    public func make(method: ApiClientHTTPMethod, path: String) -> URLRequestHolder {
        var urlRequest = URL(string: configuration.serverHost)
            .map { $0.appendingPathComponent(path) }
            .flatMap { URLRequest(url: $0) }

        urlRequest?.httpMethod = method.rawValue

        let holder = ApiClientRequestBuilder.Request(
            urlRequest: urlRequest,
            jsonEncoder: jsonEncoder,
            debugMode: configuration.debugMode
        )

        return holder
    }
}

public protocol URLRequestHolder: AnyObject {
    var urlRequest: URLRequest? { get }

    func set<T: Encodable>(body: T, customEncoder: JSONEncoder?) -> URLRequestHolder
    func add(header: String, value: String) -> URLRequestHolder
    func mock(config: ((URLRequest) -> RequestMock)?) -> URLRequestHolder
}

public extension URLRequestHolder {

    func set<T: Encodable>(body: T) -> URLRequestHolder {
        set(body: body, customEncoder: nil)
    }
}

// MARK: - URLRequestHolder

private extension ApiClientRequestBuilder {

    class Request: URLRequestHolder {

        var urlRequest: URLRequest?

        private let jsonEncoder: JSONEncoder
        private let debugMode: Bool

        init(
            urlRequest: URLRequest?,
            jsonEncoder: JSONEncoder,
            debugMode: Bool
        ) {
            self.urlRequest = urlRequest
            self.jsonEncoder = jsonEncoder
            self.debugMode = debugMode
        }

        func set<T: Encodable>(body: T, customEncoder: JSONEncoder?) -> URLRequestHolder {
            urlRequest?.httpBody = try? (customEncoder ?? jsonEncoder).encode(body)
            return self
        }

        func add(header: String, value: String) -> URLRequestHolder {
            urlRequest?.addValue(value, forHTTPHeaderField: header)
            return self
        }

        func mock(config: ((URLRequest) -> RequestMock)?) -> URLRequestHolder {
            guard debugMode else {
                return self
            }

            guard let request = urlRequest, let config = config else {
                return self
            }

            urlRequest?.set(mock: config(request))
            return self
        }
    }
}
