//
//  WidgetViewController+Ext.swift
//  YandexPaySDKDemoApp
//
//  Created by Ilia Cherkasov on 06.11.2024.
//

import UIKit

extension WidgetViewController {
    enum Section {
        case size
        case order
        case general([GeneralItem])
        case appearance([AppearanceItem])
        case headerStyle([HeaderItem])

        var name: String {
            switch self {
            case .size:
                "Size"
            case .order:
                "Order"
            case .general:
                "General"
            case .appearance:
                "Appearance"
            case .headerStyle:
                "Header Style"
            }
        }
        var rowNumbers: Int {
            switch self {
            case .size, .order:
                1
            case let .general(items):
                items.count
            case let .appearance(items):
                items.count
            case let .headerStyle(items):
                items.count
            }
        }
    }

    enum GeneralItem {
        case amout
        case style
    }

    enum AppearanceItem {
        case theme
        case transparent
        case radius
        case background
        case widgetSize
        case outline
        case padding
    }

    enum HeaderItem: Int {
        case headerSelection
        case button
    }
}
