//
//  Asset.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 28.06.2023.
//

import SwiftUI

public enum Asset {

    /// TabBar
    public static var tabMain: Image {
        return Image(systemName: "house")
    }

    public static var tabProfile: Image {
        return Image(systemName: "person.crop.circle")
    }

    public static var tabFavorites: Image {
        return Image(systemName: "heart")
    }

    /// Icons
    public static var like: Image {
        return Image("like")
    }

    public static var comments: Image {
        return Image("comments")
    }

    public static var favorite: Image {
        return Image("favorite")
    }

    public static var menu: Image {
        return Image("menu")
    }
}
