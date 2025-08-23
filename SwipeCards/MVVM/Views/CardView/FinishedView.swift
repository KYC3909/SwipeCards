//
//  FinishedView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 23/08/25.
//

import SwiftUI

struct FinishedView: View {
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Finished Swiping")
                .font(.body)
                .multilineTextAlignment(.center)
            ReloadButtonView(title: "Reload") {
                action()
            }
        }
    }
}
