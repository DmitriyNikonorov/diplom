//
//  AppCoordinator.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 04.07.2023.
//

import Swinject
import SwiftUI

final class AppCoordinator {
    private(set) var resolver: Resolver

//    private var router: Router

    init(
        resolver: Resolver
//        appSessionStorage: AppSessionStorage
    ) {
//        self.window = window

//        let model = RouterModel()
//        self.router = Router(viewModel: model)
        self.resolver = resolver
//        self.appSessionStorage = appSessionStorage
//        super.init()

//        self.router.rootController.navigationBar.isTranslucent = false

//        if self.window.isKeyWindow == false {
//            self.window.rootViewController = self.router.rootController
//            self.window.makeKeyAndVisible()
//        }
    }

//    override func start() {
    // TODO: - Метод должен принимать что-то из модели, на основе чего открывать либо HomeCoordinator либо WelcomeCoordiantor
    func start(isCredentioalsSetInDatabase: Bool) -> some View {
//        super.start()
//        runHomeFlow()

        guard let viewModel = resolver.resolve(HomeViewModel.self)
                    else { fatalError("Unable to instantiate AuthViewModel") }
//        return WelcomeView(viewModel: viewModel, isUserExist: <#Binding<Bool>#>)
        return Text("")

    }

    func runHomeFlow() {
//        guard let coordinator = resolver.resolve(HomeFlowCoordinator.self, argument: router)
//        else { fatalError("Unable to instantiate HomeFlowCoordinator") }
//
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            self?.removeDependency(coordinator)
//        }
//
//        addDependency(coordinator)
//        coordinator.start()
    }
}




final class RouterModel {
    typealias ControllerState = State

    @Published var route: String = ""
//    @Published var view: any View = WelcomeView(viewModel: WelcomeViewModel())




    init() {
//        super.init()
        setupBindings()
    }

    private func setupBindings() {
//        state.$route.drive { [weak self] route in
//            guard let self = self else { return }
//            self.route = route.rawValue
//        }.disposed(by: disposeBag)
    }
}

extension RouterModel {
//    final class State {
//        @DriverValue fileprivate(set) var route: RouterOld.Route = .welcomeView
//    }
}

    struct RouterOld: View {

        enum Route: String {
            case welcomeView, registrationView
        }

        @ObservedObject var viewModel: ViewModel

//        private var viewModel: ViewModel?

//        mutating func setRouting(to route: Route, with model: ViewModel) -> some View {
//            tagSelector = route.rawValue
//            return self
//        }

        @State var tagSelector: String = ""

        var body: some View {
            NavigationView {
//                NavigationLink(LocalizedStringKey(""), destination: WelcomeView(viewModel: WelcomeViewModel()), tag: "welcomeView", selection: $tagSelector)
//                NavigationLink(LocalizedStringKey(""), destination: RegistrationView(viewModel: WelcomeViewModel()), tag: "registrationView", selection: $tagSelector)
            }
        }

    }


