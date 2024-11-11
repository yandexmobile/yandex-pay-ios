//
//  BadgesViewController_Ext.swift
//  YandexPaySDKDemoApp
//
//  Created by Anastasiia Ishchenko on 08.11.2024.
//

import UIKit

extension BadgesViewController {
    enum Section {
        case size
        case appearance([AppearanceItem])
        case cashbackConfig([ConfigItem])
        case splitConfig([ConfigItem])

        var name: String {
            switch self {
            case .size:
                "Size"
            case .appearance:
                "Appearance"
            case .cashbackConfig:
                "Cashback configuration"
            case .splitConfig:
                "Slit configuration"
            }
        }
        var rowNumbers: Int {
            switch self {
            case .size:
                1
            case let .appearance(items):
                items.count
            case let .cashbackConfig(items):
                items.count
            case let .splitConfig(items):
                items.count
            }
        }
    }

    enum AppearanceItem {
        case amout
        case align
        case theme
    }
    
    enum ConfigItem {
        case color
        case variant
    }
    
    enum ConfigItemType {
        case cashback
        case split
    }
}

