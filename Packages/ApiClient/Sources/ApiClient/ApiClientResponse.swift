import Foundation

public protocol ApiClientResponse: Decodable {

    associatedtype ResponseData: Decodable
    associatedtype ResponseError: Error & Decodable

    var data: ResponseData? { get }
    var errors: [ResponseError]? { get }
}

public extension ApiClient {

    struct Response<ResponseData: Decodable>: ApiClientResponse {
        public let data: ResponseData?
        public let errors: [ResponseError]?
    }

    struct ResponseError: Decodable, Error {
        let code: Int?
        let title: String
    }
}
