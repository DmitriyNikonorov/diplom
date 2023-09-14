//
//  TextFieldFielder.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 01.09.2023.
//

import SwiftUI

struct TextFieldFielder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Palette.Colors.textSecondary, lineWidth: 2)
            )
            .padding(.horizontal, 24)
            .keyboardType(.phonePad)
            .textContentType(.telephoneNumber)
            .multilineTextAlignment(.center)
            .accentColor(Color.mainAccent)
    }
}
