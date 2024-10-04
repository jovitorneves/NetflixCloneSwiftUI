//
//  TabBar.swift
//  NetflixClone
//
//  Created by J. Vitor Neves on 01/10/24.
//

import SwiftUI

public struct TabBar: View {
    
    public init () {
        // intentionally not implemented
    }
    
    public var body: some View {
        TabView {
            HomeContentView(viewModel: HomeViewModel(serviceManger: HomeManager(serviceManager: HomeService())))
                .tabItem {
                    Image(systemName: LocalizableNetflixClone.houseIconName.localized)
                    Text(LocalizableNetflixClone.homeName.localized)
                }
                .tag(0)
            
            GamesContentView(viewModel: GamesViewModel(service: GamesManager()))
                .tabItem {
                    Image(systemName: LocalizableNetflixClone.gamesIconName.localized)
                    Text(LocalizableNetflixClone.gamesName.localized)
                }
                .tag(1)
            
            MyNetflixContentView()
                .tabItem {
                    Image(systemName: LocalizableNetflixClone.newsAndHotIconName.localized)
                    Text(LocalizableNetflixClone.newsAndHotName.localized)
                }
                .tag(2)
            
            MyNetflixContentView()
                .tabItem {
                    Image(systemName: LocalizableNetflixClone.myNetflixIconName.localized)
                    Text(LocalizableNetflixClone.myNetflixName.localized)
                }
                .tag(3)
        }
        .background(Color.black)
    }
}

#Preview {
    TabBar()
}
