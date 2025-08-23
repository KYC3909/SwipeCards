//
//  RandomUserResponse.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI
import NetworkServiceProvider
import Combine

/// Top-level API response containing an array of users
struct RandomUserResponse: Decodable {
    let results: [User]
}

struct UserApiEndpointItems: ApiEndpointItems {
    var endpointString: String  = ""
    
    var method: String = {
        HTTP_METHOD.get.rawValue
    }()
    
    var queryItems: [URLQueryItem] = []
    var httpBody: Data? = nil
    var headers: HeaderConfiguration? = nil
    
    init(queryItems: [URLQueryItem]) {
        self.queryItems = queryItems
    }
}

extension RandomUserResponse {
    static func fetchData(count: Int = 20) -> AnyPublisher<RandomUserResponse, Error> {
        let apiEndpointItems = UserApiEndpointItems(queryItems: [URLQueryItem(name: "results", value: count.description)])
        return NetworkServiceManagerInjector.shared.resolve()
            .fetchData(for: apiEndpointItems)
    }

}
