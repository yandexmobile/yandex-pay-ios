//
//  PaymentSystemsView.swift
//  
//
//  Created by Angelina Reshetnikova on 02.11.2024.
//

import Foundation
import SwiftUI

struct PaymentSystemsView: View {
  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 20) {
        paySystem(image: Image(.mastercard))
        paySystem(image: Image(.mir))
        paySystem(image: Image(.visa))
        Image(.payLogo)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 22)
      }
      .padding(.top, 20)
      .padding(.bottom, 40)
      Text("Политика конфиденциальности")
      Text("© 2024 Duckstore")
        .padding(.top, 8)
    }
    .font(.system(size: 12))
    .foregroundColor(.secondary)
  }

  func paySystem(image: Image) -> some View {
    image
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(height: 16)
  }
}
