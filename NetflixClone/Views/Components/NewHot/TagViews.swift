//
//  TagViews.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI

struct TagViews: View {
    
    private enum Constants {
        static let pointSixValue: CGFloat = 0.6
        static let pointSevenValue: CGFloat = 0.7
        static let onePointZeroValue: CGFloat = 1.0
        static let eightValue: CGFloat = 8
        static let tenValue: CGFloat = 10
        static let twelveValue: CGFloat = 12
        static let twentyValue: CGFloat = 20
        static let nameGeometryEffec: String = "ACTIVETAB"
    }
    
    @ObservedObject var viewModel: NewHotViewModel
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: Constants.tenValue) {
                ForEach(viewModel.homeSection, id: \.self) { model in
                    Text(model.id.capitalizesFirst())
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(model.id == viewModel.activeTag ? .black : .white)
                        .padding(.horizontal, Constants.twelveValue)
                        .padding(.vertical, Constants.eightValue)
                        .background {
                            if model.id == viewModel.activeTag {
                                Capsule()
                                    .matchedGeometryEffect(id: Constants.nameGeometryEffec,
                                                           in: animation)
                            } else {
                                Capsule()
                                    .stroke(.gray, lineWidth: Constants.onePointZeroValue)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: Constants.pointSixValue,
                                                             dampingFraction: Constants.pointSevenValue,
                                                             blendDuration: Constants.pointSevenValue)) {
                                viewModel.activeTag = model.id
                                viewModel.fetchUserRecomendation(list: model)
                            }
                        }
                }
            }
            .padding(.horizontal, Constants.twentyValue)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TagViews(viewModel: NewHotViewModel(serviceManger: HomeManager(serviceManager: HomeService())))
}
