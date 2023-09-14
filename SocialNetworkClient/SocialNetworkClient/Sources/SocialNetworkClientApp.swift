//
//  SocialNetworkClientApp.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 28.06.2023.
//

import SwiftUI
import Combine

@main
struct SocialNetworkClientApp: App {
    let resolver = AppLayer.shared.resolver

    @ObservedObject var router = Router()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                RootView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        routTo(destination: destination)
                    }
                    .onAppear {
                        /// Обращение к сервису, который скажет, есть регистрация или нет
                        /// Допустим её нет
                        if AppLayer.shared.isAccountExistInMemory == false {
                            router.navigate(to: .welcomeScreen(viewModel: resolveModel()))
                        }
                    }
            }
            .environmentObject(router)
        }
    }

    //TODO: - Перенести в координатор
    private func routTo(destination: Router.Destination) -> some View {
        switch destination {
        case .welcomeScreen(viewModel: let model):
            return AnyView(WelcomeView(viewModel: model))
        case .registrationScreen(let model, let state):
            return AnyView(RegistrationView(viewModel: model, state: state))
        case .testScreen:
            return AnyView(EmptyView())
        }
    }

    //TODO: - Перенести в координатор
    private func resolveModel() -> HomeViewModel {
        guard let viewModel = resolver.resolve(HomeViewModel.self) else {
            fatalError("Unable to instantiate AuthViewModel")
        }
        return viewModel
    }
}
