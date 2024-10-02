//
//  TopButtonView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import SwiftUI

struct TopButtonView: View {
    
    private enum Constants {
        static let pointThreeValue: CGFloat = 0.3
        static let fiveValue: CGFloat = 5
        static let tenValue: CGFloat = 10
        static let twelveValue: CGFloat = 12
        static let fifteenValue: CGFloat = 15
    }
    
    let type: TopButtonType
    let image: String
    let title: String
    let action: () -> Void

    var body: some View {
        HStack(spacing: Constants.twelveValue) {
            Image(systemName: image)
                .fontWeight(.bold)
                .foregroundStyle(type == .play ? .black : .white)
                .frame(width: Constants.fifteenValue,
                       height: Constants.fifteenValue)
            Text(title)
                .foregroundStyle(type == .play ? .black : .white)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Constants.tenValue)
        .background(type == .play ? .white : .white.opacity(Constants.pointThreeValue))
        .clipShape(RoundedRectangle(cornerRadius: Constants.fiveValue))
        .onTapGesture {
            action()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopButtonView(type: .play,
                          image: "play.fill",
                          title: "Play") {
                print("Play button tapped")
            }

            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                TopButtonView(type: .add,
                              image: "plus",
                              title: "My List") {
                    print("My List button tapped")
                }
            }
        }
    }
}
