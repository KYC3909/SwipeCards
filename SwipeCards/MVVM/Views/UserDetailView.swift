//
//  UserDetailView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI
import UtilityProvider

/// Detail view for a selected user
struct UserDetailView: View {
    let user: User

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 20) {
                    // Profile header (static, no shrink effect)
                    AsyncImage(url: URL(string: user.picture.large)) { phase in
                        switch phase {
                        case .empty: ProgressView()
                        case .success(let image): image.resizable().scaledToFill()
                        case .failure: Color.gray
                        @unknown default: EmptyView()
                        }
                    }
                    .frame(width: geo.size.width, height: 300)
                    .clipped()

                    // User info section
                    VStack(alignment: .leading, spacing: 12) {
                        Text(user.fullName)
                            .font(.title)
                            .bold()

                        Text("Age: \(user.dob.age) • Gender: \(user.gender.capitalized)")
                            .font(.headline)

                        Divider()

                        Group {
                            Label(user.fullAddress, systemImage: "mappin.and.ellipse")
                            Label(user.location.timezone.description, systemImage: "clock")
                            Label(user.email, systemImage: "envelope")
                            Label(user.phone, systemImage: "phone")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Divider()

                        Text("Member since: \(Date.formattedDate(from: user.registered.date))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
