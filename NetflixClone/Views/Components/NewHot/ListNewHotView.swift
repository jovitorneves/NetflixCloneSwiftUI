//
//  ListNewHotView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI

struct ListNewHotView: View {
    
    @ObservedObject var viewModel: NewHotViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.newHotModel, id: \.self) { model in
                RecommendationView(viewModel: viewModel,
                                   resp: model,
                                   isLoading: viewModel.isloading)
            }
        }
    }
}

#Preview {
    ListNewHotView(viewModel: NewHotViewModel(serviceManger: HomeManager(serviceManager: HomeService())))
}
