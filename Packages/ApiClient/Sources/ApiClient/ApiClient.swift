import Foundation

public class ApiClient {
    public typealias Result<T: ApiClientResponse> = Swift.Result<T.ResponseData, ApiClientError<T>>

    private let configuration: ApiClientConfiguration
    private let builder: ApiClientRequestBuilder
    private let session: URLSession
    private let decoder: JSONDecoder

    public init(
        configuration: ApiClientConfiguration
    ) {
        self.configuration = configuration
        self.builder = ApiClientRequestBuilder(configuration: configuration)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.protocolClasses = [URLMockProtocol.self]
        let session = URLSession(configuration: sessionConfig)
        self.session = session
    }

    public func performRequest<T: ApiClientResponse>(
        factory: (ApiClientRequestBuilder) -> URLRequestHolder?,
        completion: @escaping (ApiClient.Result<T>) -> Void
    ) {
        guard let request = factory(builder)?.urlRequest else {
            return completion(.failure(.local(error: "Request not found")))
        }
        if let method = request.httpMethod, let url = request.url?.absoluteString,
            let body = request.httpBody, let json = try? JSONSerialization.jsonObject(with: body) {
            print("Start \(method) \(url) request with data: \(json)")
        }

        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(.network(error: error)))
            } else if let response = response as? HTTPURLResponse {
                guard let self = self, let data = data else {
                    completion(.failure(.local(error: "Data not found")))
                    return
                }
                if let method = request.httpMethod, let url = request.url?.absoluteString,
                    let json = try? JSONSerialization.jsonObject(with: data) {
                    print("Finish \(response.statusCode) \(method) \(url) request with data: \(json)")
                }
                do {
                    let model = try self.decoder.decode(T.self, from: data)
                    if let data = model.data, 100..<400 ~= response.statusCode {
                        completion(.success(data))
                    } else if let errors = model.errors {
                        completion(.failure(.server(statusCode: response.statusCode, responseErrors: errors)))
                    } else {
                        completion(.failure(.local(error: "Unexpected decode error")))
                    }
                } catch {
                    completion(.failure(.local(error: "Decode error: \(error)")))
                }
            } else {
                completion(.failure(.local(error: "Unexpected error")))
            }
        }
        task.resume()
    }
}
