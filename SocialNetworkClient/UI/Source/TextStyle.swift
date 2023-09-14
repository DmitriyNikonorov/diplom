//
//  TextStyle.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 23.07.2023.
//

import SwiftUI

enum TextStyle {
    case mainTitle //есть! имя аккаунта, зарегистрироваться
    case subTitle //есть!
    case mainText //есть!
    case mainAccentText
    case subText //есть!
    case nameText //есть!
    case professionText //есть!
    case date
    case smallSpecial

    var font: Font {
        switch self {
            case .mainTitle: return CustomFont.H1
            case .subTitle: return CustomFont.H2
            case .mainText: return CustomFont.text
            case .mainAccentText: return CustomFont.H1
            case .subText: return CustomFont.text
            case .smallSpecial: return CustomFont.smallText
            case .nameText: return CustomFont.H2
            default: return CustomFont.text
        }
    }

    var foregroundColor: Color {
        switch self {
            case .mainTitle: return Palette.Colors.textTitle
            case .subTitle: return Palette.Colors.textSubTitle
            case .mainText: return Palette.Colors.textPrimary
            case .mainAccentText: return Palette.Colors.textAccent
            case .subText: return Palette.Colors.textSecondary
            case .smallSpecial: return Palette.Colors.textSpecial
            case .nameText: return Palette.Colors.textPrimary
            default: return Palette.Colors.textTitle
        }
    }
}
