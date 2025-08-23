//
//  CardView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI

/// Represents a single user card
struct CardView: View {
    let user: User
    let size: CGSize
    let dragOffset: CGSize
    let isTopCard: Bool
    let isSecondCard: Bool

    var body: some View {
        VStack {
            // Profile Image
            AsyncImage(url: URL(string: user.picture.large)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Color.gray
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: size.width * 0.9, height: size.height * 0.8) // 90% width, 80% height
            .clipped()
            .overlay(alignment: .bottomLeading) {
                // Gradient overlay with name & age
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullName)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Text("\(user.dob.age) • \(user.location.country)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [.black.opacity(0.7), .clear],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            }
        }
        .frame(width: size.width * 0.9, height: size.height * 0.8) // Ensure card frame matches image
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
        .scaleEffect(isSecondCard ? 0.95 : 1.0)
        .offset(dragOffset)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // Center in screen
    }
}
