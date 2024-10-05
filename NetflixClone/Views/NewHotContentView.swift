//
//  NewHotContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct NewHotContentView: View {
    
    private enum Constants {
        static let fifteenValue: CGFloat = 15
    }
    
    @StateObject private var viewModel : NewHotViewModel
    @Namespace private var animation
    
    init(viewModel: NewHotViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: Constants.fifteenValue, content: {
                HStack{
                    Text("News & Hot")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(
                        destination: SearchContentView(viewModel: SearchViewModel(serviceManger: SearchManger(serviceManager: SearchService())))
                            .toolbar(.hidden, for: .tabBar)
                    ) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.white)
                            .font(.title3)
                    }
                }
                .padding(.horizontal, Constants.fifteenValue)
                TagViews(viewModel: viewModel)
                ListNewHotView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    NewHotContentView(viewModel: NewHotViewModel(serviceManger: HomeManager(serviceManager: HomeService())))
}
