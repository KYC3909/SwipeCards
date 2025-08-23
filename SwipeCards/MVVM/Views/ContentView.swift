//
//  ContentView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 22/08/25.
//

import SwiftUI

/// Root ContentView with header and swipe controls
struct ContentView: View {
    @StateObject private var viewModel = SwipeableCardsViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Added as a variable because this way we can also load the SwiftUI View
                header // as a subview
                
                SwipeableCardsView(viewModel: viewModel)
                CardViewFooterControl {
                    viewModel.removeTopCard()
                }
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: - Subviews

    private var header: some View {
        CardViewScreenHeader()
    }
    
}
