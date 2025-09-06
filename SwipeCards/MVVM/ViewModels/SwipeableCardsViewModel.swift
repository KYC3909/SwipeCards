//
//  SwipeableCardsViewModel.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI
import Combine

@MainActor
/// ViewModel responsible for swipe logic and state
final class SwipeableCardsViewModel: ObservableObject {
    /// Cards currently displayed
    @Published private(set) var users: [User] = []
    /// Discarded (swiped away) cards
    @Published private(set) var discarded: [User] = []
    @Published private(set) var errorValue: Error?
    private var cancellables: [AnyCancellable] = []
    private let count: Int = 20

    init() {
        //fetchUsers()
    }

    /// Fetch users from the network
    func fetchUsers() {
        // Option 1
//        NetworkServices.shared.fetchUsers(count: count) { [weak self] result in
//            guard let self else { return }
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let users):
//                    self.users = users
//                case .failure(let error):
//                    self.errorValue = error
//                    self.users = []
//                    print("❌ Failed to fetch users:", error.localizedDescription)
//                }
//            }
//        }
        
        // Option 2
        RandomUserResponse.fetchData(count: count)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                    self.errorValue = error
                    self.users = []
                }
            }, receiveValue: { (response: RandomUserResponse) in
                print("Fetched users: \(response.results)")
                self.users = response.results
            })
            .store(in: &cancellables)
    }

    // Option 3
    func fetchUsersUsingAsync() async {
        do {
            // Convert Combine to AsyncSequence
            for try await result in RandomUserResponse.fetchData(count: count).values {
                self.users = result.results
            }
        } catch {
            self.errorValue = error
            self.users = []
        }
    }
    
    /// Remove the top card from stack and store in discarded
    func removeTopCard() {
        guard let top = users.first else { return }
        users.removeFirst()
        discarded.append(top)
    }
}
