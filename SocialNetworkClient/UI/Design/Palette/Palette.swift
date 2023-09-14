//
//  Palette.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 28.06.2023.
//

import SwiftUI

public enum Palette {
    public enum Images {
        public static var checkMark: Image {
            return Image("checkMark")
        }

        public static var mainImage: Image {
            return Image("mainImage")
        }

        //TODO: - Delete
        public static var testImage: Image {
            return Image("test")
        }

        //TODO: - Delete
        public static var testPostImage: Image {
            return Image("postImageTest")
        }

    }

    public enum Colors {
        public static var backgroundWhite: Color {
            return .white
        }

        public static var backgroundAccent: Color {
            return .backgroundSecondary
        }

        public static var textAccent: Color {
            return .mainAccent
        }

        public static var textPrimary: Color {
            return .mainPrimary
        }

        public static var textSecondary: Color {
            return .mainSecondary
        }

        public static var textSubTitle: Color {
            return .mainQuaternary
        }

        public static var textTitle: Color {
            return .mainTertiary
        }

        public static var textSpecial: Color {
            return .mainSpecial
        }

        public static var mainButtonBackground: Color {
            return .mainPrimary
        }

        public static var mainButtonText: Color {
            return .backgroundPrimary
        }

        public static var tabBarItem: Color {
            return .mainAccent
        }

        public static var navigationBackButton: Color {
            return .mainPrimary
        }
    }
}

