//
//  RatingView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI

struct RatingView: View {
    
    private enum Constants {
        static let pointFiveValue: CGFloat = 0.5
        static let pointTwoFiveValue: Float = 2.5
        static let fourValue: CGFloat = 4
    }
    
    var rating: Float
    
    var body: some View {
        HStack(spacing: Constants.fourValue, content: {
            ForEach(0..<5, id: \.self) { index in
                let indie = Float(index)
                Image(systemName: LocalizableNetflixClone.starIcon.localized)
                    .font(.caption2)
                    .foregroundStyle(indie <= (rating/Constants.pointTwoFiveValue) ? .yellow : .gray.opacity(Constants.pointFiveValue))
                    
            }
        })
    }
}

#Preview {
    RatingView(rating: 10)
}
