//
//  ErrorView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 23/08/25.
//

import SwiftUI

struct ErrorView: View {
    var errorTitle: String?
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Error:\(errorTitle ?? "Unknown Error")")
                .font(.body)
                .multilineTextAlignment(.center)
            ReloadButtonView(title: "Reload") {
                action()
            }
        }
    }
}


