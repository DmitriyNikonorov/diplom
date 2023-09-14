//
//  ButtonStyle.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 04.07.2023.
//

import SwiftUI

enum ButtonStyle {
    case main
    case secondary

    var font: Font {
        switch self {
        case .main:
            return CustomFont.H1
        case .secondary:
            return CustomFont.H4
        }
    }

    var background: Color? {
        switch self {
        case .main:
            return Palette.Colors.mainButtonBackground
        case .secondary:
            return nil
        }
    }

    var foregroundColor: Color {
        switch self {
        case .main:
            return Palette.Colors.mainButtonText
        case .secondary:
            return Palette.Colors.textPrimary
        }
    }

    var cornerRadius: CGFloat? {
        switch self {
        case .main:
            return 10
        case .secondary:
            return nil
        }
    }
}
