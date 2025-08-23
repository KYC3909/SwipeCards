//
//  NetworkService.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI
import NetworkServiceProvider

/// Handles networking calls to the RandomUser API
final class NetworkServices {
    static let shared = NetworkServices()
    private init() {}

    /// Fetch users from the API
    func fetchUsers(count: Int = 10, completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?results=\(count)") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data else { return }

            do {
                let response = try JSONDecoder().decode(RandomUserResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

