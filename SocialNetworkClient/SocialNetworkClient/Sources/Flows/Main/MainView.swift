//
//  MainView.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 12.07.2023.
//

import SwiftUI
import Swinject

struct MainView: BaseView {
    typealias ViewModel = MainViewModel
    @ObservedObject var viewModel: ViewModel

    @EnvironmentObject var router: Router

    @State private var showingCredits = false

    @State var id: Int? = nil

    var body: some View {
            VStack {
                    HStack {
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                List(viewModel.items) { item in
                    PostView(
                        model: item,
                        isBottomSheetOpen: $viewModel.isMenuTapped,
                        id: $viewModel.selectedPostID
                    )
                    .listRowInsets(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                }
                .listStyle(.plain)
            }
            .sheet(isPresented: $viewModel.isShowBottomSheet) {
                Text("ID is :\(viewModel.uuidString)")
                    .presentationDetents([.fraction(0.45)])
            }
    }
}
