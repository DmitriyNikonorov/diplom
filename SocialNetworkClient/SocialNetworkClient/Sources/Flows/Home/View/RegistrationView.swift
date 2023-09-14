//
//  RegistrationView.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 04.07.2023.
//

import SwiftUI
import Swinject

struct RegistrationView: BaseView {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var router: Router
    @FocusState private var focusedOnTextField: Bool?

    var state: WelcomeState?

    var body: some View {
        GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        Spacer(minLength: 22)
                        Text(state == .registration ? "ЗАРЕГИСТРИРОВАТЬСЯ" : "С ВОЗВРАЩЕНИЕМ")
                            .modifier(TextFielder(style: .mainTitle))
                        Spacer(minLength: 10)
                        Text("Код из смс")
                            .modifier(TextFielder(style: .subTitle))
                        Text("Ваш номер **\(viewModel.phoneNumber)** будет использоваться\nдля входа в аккаунт")
                            .modifier(TextFielder(style: .subText))
                            .padding(.top, 6)
                        //TODO: - Валидация
                        TextField("_ _ _ _", text: $viewModel.smsCode)
                            .modifier(TextFieldFielder())
                            .focused($focusedOnTextField, equals: true)
                            .padding(.top, 22)
                            .onAppear {
                                focusedOnTextField = true
                            }
                        Spacer(minLength: 22)
                        ButtonView("ДАЛЕЕ", style: .main) {
                            if $viewModel.isCorrectCode.wrappedValue {
                                router.navigateToRoot()
                            }
                        }

                        Text("Нажимая кнопку “Далее” Вы принимаете пользовательское Соглашение и политику конфедициальности")
                            .modifier(TextFielder(style: .subText))
                            .padding(.top, 30)
                            .padding(.horizontal, 62)

                        Spacer()
                    }
                    .frame(minHeight: geometry.size.height)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButton(router: router))
        }
        .onTapGesture {
            focusedOnTextField = nil
        }
    }
}
