//
//  User.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI

/// Represents a user fetched from the RandomUser API
struct User: Identifiable, Decodable, Equatable {
    var id = UUID()   // For SwiftUI
    let apiId: APIId? // For RandomUser ID
    let gender: String
    let name: Name
    let dob: Dob
    let registered: Registered
    let picture: Picture
    let email: String
    let phone: String
    let location: Location
        
    private enum CodingKeys: String, CodingKey {
        case gender, name, dob, registered, picture, email, phone, location
        case apiId = "id"
    }

    // MARK: - Nested Types

    struct APIId: Decodable, Equatable {
        let name: String?
        let value: String?
    }
    
    /// Nested JSON object for user's name.
    struct Name: Decodable, Equatable {
        let title: String?
        let first: String
        let last: String
    }

    /// Nested JSON object for user's date of birth.
    struct Dob: Decodable, Equatable {
        let age: Int
        let date: String
    }

    /// Nested JSON object for registration info.
    struct Registered: Decodable, Equatable {
        let date: String
    }

    /// Nested JSON object for profile pictures.
    struct Picture: Decodable, Equatable {
        let large: String
        let medium: String
        let thumbnail: String
    }

    /// Nested JSON object for location.
    struct Location: Decodable, Equatable {
        let street: Street
        let city: String
        let state: String
        let country: String
        let postcode: StringOrInt
        let timezone: Timezone

        /// Street details.
        struct Street: Decodable, Equatable {
            let number: Int
            let name: String
        }

        /// Timezone details.
        struct Timezone: Decodable, Equatable {
            let offset: String
            let description: String
        }
    }
    
    // MARK: - Computed Properties

    /// Full name composed of first and last name.
    var fullName: String {
        "\(name.first) \(name.last)"
    }

    /// Full address formatted as street + city + state + country.
    var fullAddress: String {
        "\(location.street.number) \(location.street.name), " +
        "\(location.city), \(location.state), \(location.country)"
    }
}

// MARK: - Helpers

/// A wrapper to decode fields that may be either a `String` or an `Int`.
enum StringOrInt: Decodable, Equatable {
    case string(String)
    case int(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intVal = try? container.decode(Int.self) {
            self = .int(intVal)
        } else if let strVal = try? container.decode(String.self) {
            self = .string(strVal)
        } else {
            throw DecodingError.typeMismatch(
                StringOrInt.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Expected String or Int for postcode"
                )
            )
        }
    }
}
