//
//  WelcomeView.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 28.06.2023.
//

import SwiftUI
import Swinject

struct WelcomeView: BaseView {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var router: Router
    @FocusState private var focusedOnTextField: Bool?

    var body: some View {
        GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        Palette.Images.mainImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.7)
                            .padding(.top, 12)
                        Spacer(minLength: 12)
                        Text("Введите номер телефона")
                            .modifier(TextFielder(style: .mainTitle))
                        TextField("+7 _ _ _ -_ _ _-_ _ -_ _", text: $viewModel.phoneNumber)
                            .modifier(TextFieldFielder())
                            .focused($focusedOnTextField, equals: true)
                            .padding(.top, 18)
                        Spacer(minLength: 12)

                        ButtonView("ДАЛЕЕ", style: .main) {
                            router.navigate(
                                to: .registrationScreen(
                                    viewMode: viewModel,
                                    state: viewModel.welcomeState
                                )
                            )
                        }
                        .disabled(viewModel.isButtonDisabled)
                        Spacer()
                    }
                    .frame(minHeight: geometry.size.height)
                    .navigationBarBackButtonHidden(true)
                }
        }
        .onTapGesture {
            focusedOnTextField = nil
        }
    }
}
