//
//  StartUpAssembly.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 29.06.2023.
//

import Swinject

final class StartUpAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppCoordinator.self) { resolver in
            AppCoordinator(
                resolver: AppLayer.shared.resolver
            )
        }.inObjectScope(.container)
    }
}
