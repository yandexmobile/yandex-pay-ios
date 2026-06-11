//
//  Product.swift
//
//
//  Created by Angelina Reshetnikova on 01.11.2024.
//

import Foundation
import SwiftUI

struct Product {
  let title: String
  let description: String
  let amount: Decimal
  let image: Image
}

extension Product: Equatable {
  static func == (lhs: Product, rhs: Product) -> Bool {
    lhs.title == rhs.title
    && lhs.description == rhs.description
    && lhs.amount == rhs.amount
  }
}

extension Product {
  var toAny: [String: Any] {
    ["title": "\(title)",
      "total": "\(amount)",
     "productId": "\(UUID().uuidString)",
      "quantity": [
        "count": "1"
      ]]
  }
}
