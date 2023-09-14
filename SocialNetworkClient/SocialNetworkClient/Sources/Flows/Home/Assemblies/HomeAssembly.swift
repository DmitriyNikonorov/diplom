//
//  HomeAssembly.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 03.07.2023.
//

import Swinject

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel()
        }
    }
}
