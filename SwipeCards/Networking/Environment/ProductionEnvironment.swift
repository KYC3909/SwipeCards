import Foundation
import NetworkServiceProvider


class EnvironmentInjector: NSObject {
    static func resolve() -> NetworkServiceEnvironment {
        return ProductionEnvironment()
    }
}

final class ProductionEnvironment: NetworkServiceEnvironment {
    var name: String
    var gateway: GatewayEnvironment
    
    init() {
        name = EnvironmentType.production.descr()
        gateway = ProductionGatewayEnvironment()
    }
}

