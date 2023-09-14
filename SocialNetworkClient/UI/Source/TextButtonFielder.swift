//
//  ButtonFielder.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 23.07.2023.
//

import SwiftUI

struct TextButtonFielder: ViewModifier {
    var style: ButtonStyle
    
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing], 32)
            .padding([.top, .bottom], 14)
            .font(style.font)
            .background(style.background)
            .foregroundColor(style.foregroundColor)
            .cornerRadius(style.cornerRadius ?? 0)
    }
}
