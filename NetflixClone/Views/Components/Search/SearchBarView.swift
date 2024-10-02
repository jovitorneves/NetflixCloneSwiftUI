//
//  SearchBarView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI

struct SearchBarView: View {
    
    private enum Constants {
        static let pointSevenValue: CGFloat = 0.7
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
        static let twentyValue: CGFloat = 20
    }
    
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: Constants.tenValue, content: {
            Image(systemName: LocalizableNetflixClone.searchIconName.localized)
                .foregroundStyle(Color.white.opacity(Constants.pointSevenValue))
                .frame(width: Constants.fifteenValue,
                       height: Constants.fifteenValue)
            
            TextField(LocalizableNetflixClone.searchTFPlaceholder.localized,
                      text: $searchText)
                .font(.title3)
                .fontWeight(.semibold)
                .tint(.white)
            
            Button(action: {}, label: {
                Image(systemName: LocalizableNetflixClone.micIconName.localized)
                    .foregroundStyle(Color.white.opacity(Constants.pointSevenValue))
                    .frame(width: Constants.fifteenValue,
                           height: Constants.fifteenValue)
            })
        })
        .padding(.horizontal, Constants.twentyValue)
        .padding(.vertical, Constants.fifteenValue)
        .background(Color(uiColor: .systemGray3))
    }
}

#Preview {
    SearchBarView(searchText: .constant(String("Testing")))
}
