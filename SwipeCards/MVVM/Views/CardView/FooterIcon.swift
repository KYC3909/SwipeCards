//
//  FooterIcon.swift
//  SwipeCards
//
//  Created by Krunal Chauhan on 23/08/25.
//

import SwiftUI

struct FooterIcon: View {
    var title: String
    var color: Color
    
    var body: some View {
        Image(systemName: title)
            .font(.title2)
            .padding()
            .background(Circle().fill(color.opacity(0.15)))
    }
}
