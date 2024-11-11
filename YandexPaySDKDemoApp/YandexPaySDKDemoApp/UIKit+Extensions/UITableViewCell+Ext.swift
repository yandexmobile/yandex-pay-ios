//
//  UITableViewCell+Ext.swift
//  YandexPaySDKDemoApp
//
//  Created by Ilia Cherkasov on 06.11.2024.
//

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        return String(reflecting: self)
    }
}
