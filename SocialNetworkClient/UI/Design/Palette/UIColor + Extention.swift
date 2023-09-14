//
//  UIColor + Extention.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 28.06.2023.
//

import SwiftUI

public extension Color {
    static var backgroundPrimary: Color { Color(hex: 0xFFFFFF) }
    static var backgroundSecondary: Color { Color(hex: 0xF5F3EE) }
    static var mainAccent: Color { Color(hex: 0xF69707) }
    static var mainSpecial: Color{ Color(hex: 0x0863EB) }
    static var mainPrimary: Color { Color(hex: 0x263238) }
    static var mainSecondary: Color { Color(hex: 0x7E8183) }
    static var mainTertiary: Color { Color(hex: 0x000000) }
    static var mainQuaternary: Color{ Color(hex: 0xD9D9D9) }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
