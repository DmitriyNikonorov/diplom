//
//  TextFielder.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 23.07.2023.
//

import SwiftUI

struct TextFielder: ViewModifier {
    var style: TextStyle
    var alignment: TextAlignment = .center
    
    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(style.foregroundColor)
            .multilineTextAlignment(alignment)
    }
}






