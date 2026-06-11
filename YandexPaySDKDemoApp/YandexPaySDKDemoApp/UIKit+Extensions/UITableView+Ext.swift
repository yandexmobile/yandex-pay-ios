//
//  UITableView+Ext.swift
//  YandexPaySDKDemoApp
//
//  Created by Ilia Cherkasov on 06.11.2024.
//

import UIKit

extension UITableView {
    func registerCell(type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.identifier)
    }

    func registerCells(types: [UITableViewCell.Type]) {
        types.forEach { registerCell(type: $0) }
    }

    func dequeueCell<T: UITableViewCell>(withType type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier) as! T
    }
}
