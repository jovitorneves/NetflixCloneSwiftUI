//
//  DescriptionGameView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct DescriptionGameView: View {
    
    private enum Constants {
        static let fifteenValue: CGFloat = 15
    }
    
    var description: String
    
    var body: some View {
        Text(description)
            .multilineTextAlignment(.leading)
            .font(.headline)
            .fontWeight(.medium)
            .padding(.horizontal, Constants.fifteenValue)
    }
}

#Preview {
    DescriptionGameView(description: "Begin a festive journey in our Christmas maze game! Guide Santa using your mouse, touch, or keyboard through captivating mazes to bring joy to waiting children. Find optimal paths, deliver heartwarming gifts, and immerse yourself in holiday spirit across 15 challenging levels. Spread Christmas cheer in this enchanting game!")
}
