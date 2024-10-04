//
//  NavigationGameButton.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 03/10/24.
//

import SwiftUI

struct NavigationGameButton: View {
    
    private enum Constants {
        static let tenValue: CGFloat = 10
        static let fifteenValue: CGFloat = 15
    }
    
    @Binding var isShow: Bool
    
    var body: some View {
        Button(action: {
            isShow.toggle()
        }, label: {
            HStack(spacing: Constants.tenValue) {
                Image(systemName: "play.fill")
                    .foregroundStyle(.white)
                Text("Play")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, Constants.fifteenValue)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: Constants.fifteenValue))
            .padding(.horizontal, Constants.fifteenValue)
            .padding(.top, Constants.fifteenValue)
        })
    }
}

#Preview {
    NavigationGameButton(isShow: .constant(true))
}
