//
//  ContentView.swift
//  YandexPaySDKSPMDemoApp
//
//  Created by Matvey Kravtsov on 22.08.24.
//

import SwiftUI
import YandexPaySDK

struct ContentView: View {

  @State
  private var yandexPay: YandexPaySDKApi?

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
          if let yandexPay {
            yandexPay.createCheckoutWidgetView(model: YPCheckoutWidgetModel(
              amount: 1000,
              currency: .rub
            ))
            yandexPay.createBadgeView(
              model:
                YPBadgeModel(
                  amount: 1000,
                  currency: .rub,
                  theme: .system,
                  align: .center,
                  type: .cashback(color: .primary, variant: .default)
                ))
          }
        }
        .padding()
        .onAppear {
          do {
            yandexPay = try YandexPaySDKApi.createInstance(with: YandexPaySDKConfiguration(
              environment: .sandbox,
              merchant: YandexPaySDKMerchant(
                id: "a5f49c84-0baa-41e1-814f-6f99746a6987",
                name: "",
                url: nil
              ),
              locale: .ru
            ))
            print(yandexPay!)
          } catch {
            print(error)
          }
        }
    }
}

#Preview {
    ContentView()
}
