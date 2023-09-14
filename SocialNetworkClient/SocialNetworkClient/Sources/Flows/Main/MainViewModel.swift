//
//  MainViewModel.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 12.07.2023.
//

import Combine
import SwiftUI

final class MainViewModel: ViewModel {
    @Published var items: [PostModel]  = [
        PostModel(name: "Mary", profession: "Designer", text: "Для изменения высоты виджета Text по нажатию кнопки в SwiftUI, вам потребуется использовать @State переменную для хранения состояния высоты текста, а затем изменять значение этой переменной по нажатию кнопки.", likesCount: 1, commentsCount: 0, isFavorites: true),
        PostModel(name: "Mary", profession: "Designer", text: "Для изменения высоты виджета Text по нажатию кнопки в SwiftUI, вам потребуется использовать @State переменную для хранения состояния высоты текста, а затем изменять значение этой переменной по нажатию кнопки.", likesCount: 1, commentsCount: 0, isFavorites: false),
        PostModel(name: "Mary", profession: "Designer", text: "Для изменения высоты виджета Text по нажатию кнопки в SwiftUI, вам потребуется использовать @State переменную для хранения состояния высоты текста, а затем изменять значение этой переменной по нажатию кнопки.", likesCount: 1, commentsCount: 0, isFavorites: false),
        PostModel(name: "Mary", profession: "Designer", text: "Для изменения высоты виджета Text по нажатию кнопки в SwiftUI, вам потребуется использовать @State переменную для хранения состояния высоты текста, а затем изменять значение этой переменной по нажатию кнопки.", likesCount: 1, commentsCount: 0, isFavorites: true)
    ]

    private var cancellableSet: Set<AnyCancellable> = []

    /// output
    @Published var isShowBottomSheet = false
    @Published var uuidString = ""

    /// input
    @Published var selectedPostID: UUID?
    @Published var isMenuTapped = false

    func deletePost(at id: UUID) {
        items.removeAll(where: { $0.id == id })
    }

    override init() {
        super.init()
        setupBindings()
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

extension MainViewModel {
    private var isPostExist: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($selectedPostID, $isMenuTapped)
            .map { [weak self] id, _ in
                guard let self = self else { return false }
                if self.items.first(where: { $0.id == id }) != nil {
                    self.uuidString = id?.uuidString ?? ""
                    return true
                }
                return false
            }
            .eraseToAnyPublisher()
    }

    private func setupBindings() {
        isPostExist
            .receive(on: RunLoop.main)
            .assign(to: \.isShowBottomSheet, on: self)
            .store(in: &cancellableSet)
    }
}
