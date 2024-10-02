//
//  HomeContentView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import SwiftUI
internal import SDWebImageSwiftUI

struct HomeContentView: View {
    
    private enum Constants {
        static let twentyValue: CGFloat = 20
        static let thirtyValue: CGFloat = 30
        static let thirtyTwoValue: CGFloat = 32
    }
    
    @ObservedObject private var viewModel: HomeViewModel
    @State private var bannerImage: URL?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader {
                    let size = $0.size
                    ScrollView {
                        VStack {
                            HeaderView(bannerImage: bannerImage)
                                .padding(.horizontal, Constants.twentyValue)
                                .padding(.vertical, Constants.twentyValue)
                                .shimmering(active: viewModel.isloading, animation: .bouncy)

                            ListView(viewModel: viewModel,
                                     size: size)
                        }
                        .padding(.bottom, Constants.thirtyValue)
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                Task {
                    do {
                        try await viewModel.manageHomeResponse()
                        bannerImage = viewModel.bannerImage
                    } catch {
                        
                    }
                }
            }
            .onDisappear { UIScrollView.appearance().bounces = true }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    HStack {
                        Image(LocalizableNetflixClone.netflixName.localized,
                              bundle: Bundle(for: NetworkManager.self))
                            .resizable()
                            .scaledToFill()
                            .frame(width: Constants.twentyValue,
                                   height: Constants.thirtyTwoValue)
                        Spacer()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        NavigationLink(
                            destination: SearchContentView(viewModel: SearchViewModel(serviceManger: SearchManger(serviceManager: SearchService())))
                                .toolbar(.hidden, for: .tabBar)
                        ) {
                            Image(systemName: LocalizableNetflixClone.searchIconName.localized)
                                .foregroundStyle(Color.white)
                                .frame(width: Constants.twentyValue,
                                       height: Constants.twentyValue)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeContentView(viewModel: HomeViewModel(serviceManger: HomeManager(serviceManager: HomeService())))
}
