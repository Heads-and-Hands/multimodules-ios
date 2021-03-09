import Foundation

public class URLMockProtocol: URLProtocol {

    public override class func canInit(with request: URLRequest) -> Bool {
        request.mockFileUrl != nil
    }

    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    public override func startLoading() {
        Bundle(for: URLMockProtocol.self).loadMock(with: request.mockFileUrl) { [self] data in
            guard let client = self.client else {
                return
            }

            guard let url = self.request.url else {
                client.urlProtocolDidFinishLoading(self)
                return
            }

            let response: HTTPURLResponse?

            if let data = data {
                response = HTTPURLResponse(url: url, statusCode: self.request.mockStatusCode, httpVersion: nil, headerFields: nil)
                client.urlProtocol(self, didLoad: data)
            } else {
                response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)
            }

            if let response = response {
                client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }

            client.urlProtocolDidFinishLoading(self)
        }
    }

    public override func stopLoading() {
    }
}

// MARK: - Bundle

public extension Bundle {

    func loadMock(with url: URL?, delay: TimeInterval = 0.4, completion: @escaping (Data?) -> Void) {
        guard let url = url, let data = try? Data(contentsOf: url) else {
            completion(nil)
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            completion(data)
        }
    }
}
