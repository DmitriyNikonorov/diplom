//
//  Font.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 29.06.2023.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case regular = "Lato-Regular"
    case bold = "Lato-Bold"
    case light = "Lato-Light"
    case thin = "Lato-Thin"

    func font(size: CGFloat) -> Font {
        return Font.custom(rawValue, size: size)
    }

    public static func regular(size: CGFloat) -> Font {
        return Font.custom(regular.rawValue, size: size)
    }

    public static func bold(size: CGFloat) -> Font {
        return Font.custom(bold.rawValue, size: size)
    }

    public static func light(size: CGFloat) -> Font {
        return Font.custom(light.rawValue, size: size)
    }


    public static func thin(size: CGFloat) -> Font {
        return Font.custom(thin.rawValue, size: size)
    }

    public static var H1: Font {
        let device = Device.current
        if device == .pad {
            return regular(size: 24)
        } else {
            return regular(size: 18)
        }
    }

    public static var H2: Font {
        let device = Device.current
        if device == .pad {
            return bold(size: 24)
        } else {
            return bold(size: 18)
        }
    }

    public static var H3: Font {
        let device = Device.current
        if device == .pad {
            return bold(size: 22)
        } else {
            return bold(size: 16)
        }
    }

    public static var H4: Font {
        let device = Device.current
        if device == .pad {
            return regular(size: 20)
        } else {
            return regular(size: 14)
        }
    }

    public static var text: Font {
        let device = Device.current
        if device == .pad {
            return regular(size: 20)
        } else {
            return regular(size: 14)
        }
    }

    public static var boldText: Font {
        let device = Device.current
        if device == .pad {
            return bold(size: 20)
        } else {
            return bold(size: 14)
        }
    }

    public static var smallText: Font {
        let device = Device.current
        if device == .pad {
            return thin(size: 18)
        } else {
            return thin(size: 12)
        }
    }
}
