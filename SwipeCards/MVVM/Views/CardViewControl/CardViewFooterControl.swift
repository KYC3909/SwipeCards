//
//  CardViewFooterControl.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 23/08/25.
//

import SwiftUI

struct CardViewFooterControl: View {
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 24) {
            Button(action: { action() }) {
                FooterIcon(title: "xmark", color: .red)
            }
            Button(action: { action() }) {
                FooterIcon(title: "heart.fill", color: .green)
            }
        }
        .padding(.bottom, 24)
    }
}



