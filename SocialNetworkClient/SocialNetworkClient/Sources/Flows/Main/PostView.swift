//
//  PostView.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 12.07.2023.
//

import SwiftUI
import Swinject

struct PostView: BaseView {
    @ObservedObject var model: PostModel
    @Binding var isBottomSheetOpen: Bool
    @Binding var id: UUID?


    func cutText(text: String) -> String {
        if text.count > 15 {
            let startIndex = text.startIndex
            let endIndex = text.index(startIndex, offsetBy: 30)
            let cutText = text[startIndex..<endIndex]
            return String(cutText) + "..."
        } else {
            return text
        }
    }

    var body: some View {
        VStack {
            HStack {
                CircleImage(image: Palette.Images.testImage)
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading) {
                    Text(model.name)
                        .modifier(TextFielder(style: .nameText, alignment: .leading))
                    Text(model.profession)
                        .modifier(TextFielder(style: .subText, alignment: .leading))
                }
                .padding(.leading, 24)
                Spacer()
                //TODO: - Добавить анимацию нажатия
                VStack() {
                    Asset.menu
                        .onTapGesture {
                            id = model.id
                            isBottomSheetOpen.toggle()
                    }
                }
            }
            .padding([.leading, .trailing], 16)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(model.text)
                        .modifier(TextFielder(style: .mainText, alignment: .leading))
                        .padding(.horizontal, 16)
                }
                .frame(maxHeight: model.isExpanded ? .infinity : 50)
                .animation(model.isExpanded ? .easeIn : .none, value: model.isExpanded)
                SpecialPostButton(isExpanded: $model.isExpanded)
                Palette.Images.testPostImage
                    .onTapGesture {
                        print("testPostImage")
                    }
                    .padding(.horizontal, 16)
                HStack {
                    Asset.like
                        .onTapGesture {
                            print("like")
                    }
                    Text(String(model.likesCount))
                        .modifier(TextFielder(style: .mainText, alignment: .leading))

                    Asset.comments
                        .onTapGesture {
                            print("comments")
                        }
                    Text(String(model.commentsCount))
                        .modifier(TextFielder(style: .mainText, alignment: .leading))

                    Spacer()
                    Asset.favorite
                        .onTapGesture {
                            print("comments")
                    }
                }
                .padding(.horizontal, 16)
                    .padding(.vertical, 18)
            }
            .background(Palette.Colors.backgroundAccent)
        }
        .frame(maxWidth: .infinity)
    }
}
