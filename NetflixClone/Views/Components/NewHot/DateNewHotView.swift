//
//  DateNewHotView.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 05/10/24.
//

import SwiftUI

struct DateNewHotView: View {
    
    private enum Constants {
        static let fiveValue: CGFloat = 5
        static let eightValue: CGFloat = 8
    }
    
    @ObservedObject var viewModel: NewHotViewModel
    var date: String

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.eightValue) {
            Text(viewModel.handlerDate(dateString: date,
                                       format: "MMM"))
                .font(.footnote)
                .fontWeight(.semibold)
            Text(viewModel.handlerDate(dateString: date,
                                       format: "d"))
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(.top, Constants.fiveValue)
    }
}

#Preview {
    DateNewHotView(viewModel: NewHotViewModel(serviceManger: HomeManager(serviceManager: HomeService())),
                   date: "12/12/2024")
}
