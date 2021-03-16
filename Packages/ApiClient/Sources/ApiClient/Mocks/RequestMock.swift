import Foundation

public enum RequestMock {
    case custom(_ fileUrl: URL?, statusCode: Int)
}

extension URLRequest {
    private enum Constants {
        static let mockFileName = "X-Mock-file-name"
        static let mockStatusCode = "X-Mock-status-code"
    }

    var mockFileUrl: URL? {
        URL(string: value(forHTTPHeaderField: Constants.mockFileName) ?? "")
    }

    var mockStatusCode: Int {
        Int(value(forHTTPHeaderField: Constants.mockStatusCode) ?? "200") ?? 200
    }

    mutating func set(mock: RequestMock) {
        let jsonFielUrlString: String
        let responseStatusCode: String

        switch mock {
        case let .custom(fileUrl, statusCode):
            jsonFielUrlString = fileUrl?.absoluteString ?? ""
            responseStatusCode = String(statusCode)
        }

        addValue(jsonFielUrlString, forHTTPHeaderField: Constants.mockFileName)
        addValue(responseStatusCode, forHTTPHeaderField: Constants.mockStatusCode)
    }
}
