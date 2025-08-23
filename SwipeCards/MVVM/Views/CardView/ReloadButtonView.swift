//
//  ReloadButtonView.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 23/08/25.
//

import SwiftUI

struct ReloadButtonView: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(title)
            { action() }
            .buttonStyle(.borderedProminent)
    }
}


