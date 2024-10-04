//
//  SearchContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct SearchContentView: View {
    
    private enum Constants {
        static let pointThreeValue: CGFloat = 0.3
        static let twentyValue: CGFloat = 20
    }
    
    @ObservedObject private var viewModel: SearchViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero, content: {
                VStack(spacing: Constants.twentyValue) {
                    HStack{
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .font(.title)
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .padding(.horizontal, Constants.twentyValue)
                        })
                    }
                    SearchBarView(searchText: $viewModel.searchTxt)
                    if viewModel.searchTxt.isEmpty {
                        SuggestionView(discoverModel: viewModel.discoverModel,
                                       isLoading: viewModel.isLoading)
                    } else {
                        withAnimation(.easeIn(duration: Constants.pointThreeValue)) {
                            SearchView(searchModel: $viewModel.searchDetail,
                                       isLoading: $viewModel.isSearching)
                        }
                    }
                }
            })
            .onChange(of: viewModel.searchTxt) { oldValue, newValue in
                Task{
                    try await viewModel.getSearch()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SearchContentView(viewModel: SearchViewModel(serviceManger: SearchManger(serviceManager: SearchService())))
}
