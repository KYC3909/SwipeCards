import Foundation
import NetworkServiceProvider

public class JSONParser: JSONDecoder, DataParserProvider, @unchecked Sendable {
    public var strategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    
    override init() {
        super.init()
    }

    public func decode() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = strategy
        return decoder
    }
    
}

