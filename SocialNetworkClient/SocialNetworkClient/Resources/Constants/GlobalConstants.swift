//
//  GlobalConstants.swift
//  SocialNetworkClient
//
//  Created by Дмитрий Никоноров on 28.06.2023.
//

import Foundation
import SwiftUI

public typealias VoidHandler = () -> Void
public typealias BoolHandler = (Bool) -> Void
public typealias IntHandler = (Int) -> Void
//public typealias NumberHandler = (UInt) -> Void


public enum GlobalConstants {
//    static var bundleId: String? { Bundle.main.bundleIdentifier }
//    static var appVersion: String? { Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String }
//    static var bundleVersion: String? { Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String }
//    static let appMetricaKey: String = "6abbbb08-698e-47c6-96be-c6e6fd387c00"
//    static let merchantId: String = "merchant.ru.sdisk"


    ///////
//    static let hasBottomNotch: Bool = UIApplication.shared.hasBottomNotch
//    static var tabBarHeight: CGFloat {
//        return hasBottomNotch ? 82 : 64
//    }


//    static let pinLength: Int = 6
//
//    static let baseLocation: (lat: Double, lon: Double) = (lat: 55.751322, lon: 37.617592 )
//
//    public enum Delay {
//        public enum UploadService {
//            static let updateDataInMilliseconds = 500
//            static let updateAnimationInSeconds = Double(Delay.UploadService.updateDataInMilliseconds) / 1000
//        }
//    }

    // Need to change these URLs in depend of build schema
//    static let registrationAuth = "https://sberdisk.ru/sberdisk/ios/topics/auth.html"
//    static let helpUrl = "https://disk.sdbcloud.ru/public-help/instruction"
//    static let policyUrl = "https://sberdisk.ru/sberdisk/ios/topics/legal_privacy-policy.html"
//    static let dataProcessing = "https://sberdisk.ru/sberdisk/ios/topics/legal_processing-of-personal-data.html"
//    static let termsOfUseUrl = "https://sberdisk.ru/sberdisk/ios/topics/legal_terms-of-use.html"
//    static let showHowFavoritesUrl = "https://sberdisk.ru/sberdisk/ios/topics/ios_files-favorites.html"
//    static let showHowSharedUrl = "https://sberdisk.ru/sberdisk/ios/topics/ios_sharing.html"
//    static let showHowOfflineUrl = "https://sberdisk.ru/sberdisk/ios/topics/ios_offline.html"
//    static let webTarrifs = "https://sberdisk.ru/sberdisk/ios/topics/tariffs_refund.html"
//
//    static let fileNameBlackListPattern = #"[^/\\<>:"“”|?*]"#
//     static let albumNameBlackListPattern = #"[^/\\<>:"“”|?*]"#
}

public enum Device {
    case phone
    case pad
    case other

    static var current: Device {
        if Device.isIpad != nil {
            return Device.isIpad! ? .pad : .phone
        } else {
            return .other
        }
    }


    static var isIpad: Bool? {
        if modelIdentifier.contains("iPhone") {
            return false
        } else if modelIdentifier.contains("iPad") {
            return true
        } else {
            return nil
        }
    }

    static var modelIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}


