//
//  HomeViewModel.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 29.06.2023.
//

import Combine
import SwiftUI

enum WelcomeState: String, Codable {
    case registration, auth
}

final class HomeViewModel: ViewModel {
    // Модель долждна проверять есть ли в памяти логин. А в идеале есть ли токен авторизиции
    private let correctNumber = "55555"
    private let correctCode = "111"

    /// input
    @Published var phoneNumber: String = ""
    @Published var confirmPhoneNumber: String = ""
    @Published var smsCode: String = ""

    /// output
    @Published var welcomeState: WelcomeState? = .none
    @Published var isCorrectNumber: Bool = false
    @Published var isButtonDisabled: Bool = true
    @Published var isCorrectCode: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []

    override init() {
        super.init()
        setupBindings()
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

extension HomeViewModel {
    private var isValidated: AnyPublisher<Bool, Never> {
        $phoneNumber
            .map { number in
                return number.count > 4
            }
            .eraseToAnyPublisher()
    }

    private var isAuthorized: AnyPublisher<Bool, Never> {
        isValidated
            .map { [weak self] isValidated in
                guard let self = self else { return false }
                if isValidated {
                    if self.phoneNumber == self.correctNumber {
                        return true
                    }
                }
                return false
            }
            .eraseToAnyPublisher()
    }

    private var isCorrect: AnyPublisher<Bool, Never> {
        $smsCode
            .map { [weak self] code in
                guard let self = self else { return false }
                return code == self.correctCode
            }
            .eraseToAnyPublisher()
    }

    private func setupBindings() {
        isCorrect
            .sink { [weak self] isCorrect in
                guard let self = self else { return }
                isCorrectCode = isCorrect
            }
            .store(in: &cancellableSet)
        
        ///Validation
        $phoneNumber
            .sink { [weak self] number in
                guard let self = self else { return }
                self.isButtonDisabled = number.count <= 4
            }
            .store(in: &cancellableSet)

        

        isAuthorized
            .sink { [weak self] isExist in
                guard let self = self else { return }
                if isExist {
                    self.welcomeState = .auth
                } else {
                    self.welcomeState = .registration
                }
            }
            .store(in: &cancellableSet)
    }
}
