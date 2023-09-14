//
//  MainAssembly.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 14.09.2023.
//

import Swinject

final class MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainViewModel.self) { resolver in
            MainViewModel()
        }
    }
}
