//
//  SwipeableCardsView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI

/// Swipeable Tinder-like carousel with visible multi-layer stack
struct SwipeableCardsView: View {
    @ObservedObject var viewModel: SwipeableCardsViewModel
    @State private var drag: CGSize = .zero
    @State private var selectedUser: User?
    @State private var showDetail = false

    /// How many cards should be visible in the stack
    private let visibleStackDepth = 5

    var body: some View {
        GeometryReader { geo in
            if let error = viewModel.errorValue {
                ErrorView(errorTitle: error.localizedDescription, action: {
                    viewModel.fetchUsers()
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else if viewModel.users.isEmpty && viewModel.discarded.isEmpty {
                LoadingProgressView(title: "Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else if viewModel.users.isEmpty {
                FinishedView(action: {
                    viewModel.fetchUsers()
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else {
                ZStack {
                    // Only take top N cards for stacking
                    ForEach(Array(viewModel.users.prefix(visibleStackDepth).enumerated()), id: \.element.id) { index, user in
                        let isTop = index == 0
                        let depth = Double(index)

                        CardView(
                            user: user,
                            size: geo.size,
                            dragOffset: isTop ? drag : .zero,
                            isTopCard: isTop,
                            isSecondCard: index == 1
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        // Layering effect for cards below top
                        .scaleEffect(1 - depth * 0.05)         // Smaller as they go down
                        .offset(
                            x: isTop ? drag.width : 0,
                            y: isTop ? drag.height / 8 : depth * 14 // Push down per layer
                        )
                        .opacity(isTop ? 1.0 : 1.0 - depth * 0.1) // Fade deeper cards slightly
                        .rotationEffect(.degrees(isTop ? Double(drag.width) / Constants.Swipe.rotationFactor : 0))
                        .gesture(isTop ? dragGesture : nil)
                        .zIndex(Double(visibleStackDepth - index)) // Ensure correct overlap
                        .onTapGesture {
                            selectedUser = user
                            showDetail = true
                        }
                        .animation(.spring(response: 0.45, dampingFraction: 0.85), value: viewModel.users)
                    }
                }
                // Navigate to detail screen
                .navigationDestination(isPresented: $showDetail) {
                    if let user = selectedUser {
                        UserDetailView(user: user)
                    }
                }
            }
        }
        .padding()
    }

    // MARK: - Gesture

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in drag = value.translation }
            .onEnded { value in
                let shouldThrow = abs(value.translation.width) > Constants.Swipe.throwDistance
                if shouldThrow {
                    withAnimation(.easeOut(duration: 0.35)) {
                        drag.width = value.translation.width > 0 ? Constants.Swipe.flingOffset : -Constants.Swipe.flingOffset
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.34) {
                        viewModel.removeTopCard()
                        drag = .zero
                    }
                } else {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        drag = .zero
                    }
                }
            }
    }

}

