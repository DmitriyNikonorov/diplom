//
//  ViewModel.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 29.06.2023.
//

import Foundation

open class ViewModel: ObservableObject, Codable, Hashable, Equatable {
    init() {
        print("init \(String(describing: type(of: self)))")
    }
    
    deinit {
        print("deinit \(String(describing: type(of: self)))")
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public static func == (lhs: ViewModel, rhs: ViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}



