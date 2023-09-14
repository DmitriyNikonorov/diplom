//
//  BaseView.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 04.07.2023.
//

import SwiftUI

protocol BaseView: View {
    var screenName: String { get }
}

extension BaseView {
    var screenName: String {
        return String(describing: type(of: self))
    }
}
