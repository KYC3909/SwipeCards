import Foundation
import NetworkServiceProvider

public class URLSessionNetworkService: NetworkService {
    
    public var environment: NetworkServiceEnvironment!
    public var gateway: GatewayEnvironment!
    public var apiUrl: URL!
    public var baseUrl: URL!
    public var dataParser: DataParserProvider!
    
    init(environment: NetworkServiceEnvironment) {
        self.environment = environment
        self.gateway = environment.gateway
        self.baseUrl = gateway.baseUrl()
        let api = gateway.versioningApi ? gateway.apiVersionUrl() : gateway.apiBaseUrl()
        self.apiUrl = api
        self.dataParser = JSONParser()
    }
}

