//
//  SpecialPostButton.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 14.09.2023.
//

import SwiftUI

struct SpecialPostButton: View {
    @Binding var isExpanded: Bool

    var body: some View {
        Button(action: {
            isExpanded.toggle()
        }) {
            Text(isExpanded ? "Свернуть" : "Показать полностью...")
                .modifier(TextFielder(style: .smallSpecial, alignment: .leading))
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.leading, 16)
        .padding(.bottom, 10)
    }
}
