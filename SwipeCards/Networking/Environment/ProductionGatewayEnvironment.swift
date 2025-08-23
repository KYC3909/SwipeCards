import Foundation
import NetworkServiceProvider

class ProductionGatewayEnvironment: GatewayEnvironment {
    private let syncEndpoint: URL = URL(string: "https://randomuser.me")!
    var versioningApi = false
    
    func baseUrl() -> URL {
        self.syncEndpoint
    }
    
    func apiBaseUrl() -> URL {
        self.syncEndpoint.appendingPathComponent("api")
    }
    
    func apiVersionUrl() -> URL {
        apiBaseUrl().appendingPathComponent("V1.0")
    }
    
    func timeoutForRequest() -> TimeInterval {
        30
    }
}

