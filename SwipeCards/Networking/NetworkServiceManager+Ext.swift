import Foundation
import NetworkServiceProvider

public extension NetworkServiceManagerInjector {
        
    func resolve() -> NetworkServiceManager {
        if networkServiceManager == nil {
            let service = NetworkServiceInjector.shared.resolve()
            networkServiceManager = NetworkServiceManager.init(service: service)
        }
        
        return networkServiceManager
    }
    
}

public extension NetworkServiceInjector {
        
    func resolve() -> NetworkService {
        let environment = EnvironmentInjector.resolve()
        return URLSessionNetworkService(environment: environment)
    }
    
}


