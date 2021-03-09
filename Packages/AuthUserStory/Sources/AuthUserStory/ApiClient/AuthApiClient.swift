import Foundation
import ApiClient

// MARK: - AuthApiClient

protocol AuthApiClient {
    typealias AuthApiClientResult = (ApiClient.Result<ApiClient.Response<Session>>) -> Void

    func authDevice(id: String, completion:  @escaping AuthApiClientResult)
}

// MARK: - ApiClient + AuthApiClient

extension ApiClient: AuthApiClient {

    func authDevice(id: String, completion: @escaping AuthApiClientResult) {
        struct Payload: Encodable {
            let deviceId: String
        }

        return performRequest(factory: {
            $0.make(method: .post, path: "auth/device/")
                .set(body: Payload(deviceId: id))
                .mock { _ in
                    switch id {
                    case "":
                        return .custom(
                            Bundle.module.url(forResource: "400_post_auth-device_v1", withExtension: "json"),
                            statusCode: 400
                        )
                    default:
                        return .custom(
                            Bundle.module.url(forResource: "200_post_auth-device_v1", withExtension: "json"),
                            statusCode: 200
                        )
                    }
                }
        }, completion: completion)
    }
}
