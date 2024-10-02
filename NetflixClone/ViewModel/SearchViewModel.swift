//
//  SearchViewModel.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 02/10/24.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    
    @Published var discoverModel: [MovieDetailModel] = []
    @Published var searchDetail: [MovieDetailModel] = []
    @Published var searchTxt: String = String()
    @Published var isLoading: Bool = false
    @Published var isSearching: Bool = false
    
    private var serviceManger: SearchMangerDelegate
    
    init(serviceManger: SearchMangerDelegate) {
        self.serviceManger = serviceManger
        Task {
            try await getDiscover()
        }
    }
}

extension SearchViewModel {
    @MainActor
    func getDiscover() async throws {
        isLoading = true
        guard let url = URL(string: UrlsConstants.discoverUrl) else { return }
        let result = try await serviceManger.getDisCover(url: url)
        discoverModel = result
        isLoading = false
    }
    
    @MainActor
    func getSearch() async throws {
        isSearching = true
        guard let quary = searchTxt.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: UrlsConstants.searchUrl+"&query="+quary) else { return }
        let result = try await serviceManger.getSearch(url: url)
        searchDetail = result
        isSearching = false
    }
}
