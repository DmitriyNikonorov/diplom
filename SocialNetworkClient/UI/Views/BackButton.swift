//
//  BackButton.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 04.07.2023.
//

import SwiftUI

struct BackButton: View {
    var router: Router


    var body: some View {
        Button(action: {
            router.navigateBack()
        }) {
            Image(systemName: "arrow.backward")
                .foregroundColor(Palette.Colors.navigationBackButton)
        }
    }
}
