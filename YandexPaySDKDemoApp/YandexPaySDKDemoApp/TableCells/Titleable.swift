//
//  Titleable.swift
//  YandexPaySDKDemoApp
//
//  Created by Angelina Reshetnikova on 25.10.2024.
//

import Foundation

protocol Titleable: CaseIterable {
  static var allCasesTitles: [String] { get }
}
