//
//  PostModel.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 12.07.2023.
//

import SwiftUI

final class PostModel: ObservableObject, Identifiable {
    let id: UUID
    let name: String
    let profession: String

    let text: String

    let likesCount: UInt
    let commentsCount: UInt

    let isFavorites: Bool

    @Published var isExpanded = false

    init(name: String, profession: String, text: String, likesCount: UInt, commentsCount: UInt, isFavorites: Bool) {
        self.id = UUID()
        self.name = name
        self.profession = profession
        self.text = text
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.isFavorites = isFavorites
    }
}

extension PostModel: Hashable {
    static func == (lhs: PostModel, rhs: PostModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
