//
//  AppLayer.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 29.06.2023.
//

import Swinject

final class AppLayer {
    static var shared = AppLayer()
    private init() {}

    lazy var assembly = Assembler([
        StartUpAssembly(),
        HomeAssembly(),
        MainAssembly(),
        ServicesAssembly()
    ])

    lazy var resolver = assembly.resolver
//    lazy var appSessionStorage = AppSessionStorage(keychainStorage: keychainStorage)
//    lazy var keychainStorage: KeychainStorageAbstract = KeychainStorage()

    lazy var appCoordinator = resolver.resolve(AppCoordinator.self)

    var isAccountExistInMemory = false
}
