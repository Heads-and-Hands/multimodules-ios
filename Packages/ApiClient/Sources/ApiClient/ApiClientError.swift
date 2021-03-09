import Foundation

public enum ApiClientError<Response: ApiClientResponse>: Error {
    case local(error: String)
    case network(error: Error)
    case server(statusCode: Int, responseErrors: [Response.ResponseError])
}
