//
//  PayFormScreen.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 17.10.2024.
//

import SwiftUI

struct PayFormScreen: View {
    private let viewModel: PayFormViewModel

    init(viewModel: PayFormViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Button {
                viewModel.openPayForm()
            } label: {
                HStack {
                    Text("Ваша красивая кнопка")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("blueDark"))
                }
                .frame(width: 280, height: 40)
                .background(Color("blue"))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("blueDark"), lineWidth: 1)
                )            }
            Text(Constants.descriptionText)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .frame(width: 230)
        }
    }
}

extension PayFormScreen {
    enum Constants {
        static let descriptionText = "Вы можете добавить таргет открытия формы на любовой объект. Например, так и сделано с этой кнопкой"
    }
}
