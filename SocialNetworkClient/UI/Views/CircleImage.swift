//
//  CircleImage.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 14.09.2023.
//

import SwiftUI

struct CircleImage: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    }
}
