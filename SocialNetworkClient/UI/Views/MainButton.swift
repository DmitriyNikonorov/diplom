//
//  MainButton.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 29.06.2023.
//

import SwiftUI

struct ButtonView: View {
    /// Для отслеживания цветовой схемы
//    @EnvironmentObject var colorScheme: ColorScheme
    let text: String
    let action: VoidHandler
    let style: ButtonStyle

    init(_ text: String, style: ButtonStyle, action: @escaping VoidHandler) {
        self.text = text
        self.style = style
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .modifier(TextButtonFielder(style: style))
        }
    }
}


//Класс, содержащий в себе цвета для схемы
class СolorScheme: ObservableObject {
    @AppStorage("Palette") var savedPalette = "Helius"

//    @Published var palette: ColorPalette = ColorPalette.previewPalette
    init() {
//        let palette = Palette(rawValue: savedPalette)
//        loadPalette(palette)
    }

    func loadPalette(_ newPalette: Palette?) {
//        let prefix = newPalette?.rawValue ?? "ocean"
//        palette = ColorPalette(backgroundColor: Color(), )

    }
}






class ColorSchemeManager: ObservableObject {
    static let shared = ColorSchemeManager()

    @Published var primaryColor: Color = .blue
    @Published var secondaryColor: Color = .green
}


struct ContentViewTestScheme: View {
    @EnvironmentObject private var colorSchemeManager: ColorSchemeManager

    var body: some View {
        VStack {
            Text("Primary Color")
                .foregroundColor(colorSchemeManager.primaryColor)
            Text("Secondary Color")
                .foregroundColor(colorSchemeManager.secondaryColor)
        }
    }
}
