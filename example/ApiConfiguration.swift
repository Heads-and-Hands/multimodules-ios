import ApiClient

struct ApiConfiguration: ApiClientConfiguration {

    var serverHost: String {
        #if DEBUG
            return "https://test/api/"
        #else
            return "https://prod/api"
        #endif
    }

    var debugMode: Bool {
        true
    }
}
