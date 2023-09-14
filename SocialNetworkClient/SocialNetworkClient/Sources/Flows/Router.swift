//
//  Router.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 05.09.2023.
//

import SwiftUI

final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case welcomeScreen(viewModel: HomeViewModel)
        case registrationScreen(viewMode: HomeViewModel, state: WelcomeState?)
        case testScreen
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
