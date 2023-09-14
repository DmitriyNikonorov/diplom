//
//  TabBarView.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 04.07.2023.
//

import SwiftUI

struct RootView: View {
    let resolver = AppLayer.shared.resolver

    @EnvironmentObject var router: Router
    @State private var selectedTab: Tab = .main

    enum Tab {
        case main, profile, favorites
    }

    //TODO: - Перенести в координатор
    private func resolveModel() -> MainViewModel {
        guard let viewModel = resolver.resolve(MainViewModel.self) else {
            fatalError("Unable to instantiate MainViewModel")
        }
        return viewModel
    }

    var body: some View {
            TabView(selection: $selectedTab) {
                MainView(viewModel: resolveModel())
                    .tabItem {
                        Asset.tabMain
                        Text("Главная")
                    }
                    .tag(Tab.main)


                ProfileView()
                    .tabItem {
                        Asset.tabProfile
                        Text("Профиль")
                    }
                    .tag(Tab.profile)

                FavouriteView()
                    .tabItem {
                        Asset.tabFavorites
                        Text("Сохраненное")
                    }
                    .tag(Tab.favorites)
            }
            .tint(Palette.Colors.textAccent)
        .navigationBarBackButtonHidden(true)
    }
}
