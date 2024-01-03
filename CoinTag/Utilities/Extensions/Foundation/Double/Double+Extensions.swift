//
//  Double+Extensions.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//

import Foundation

// MARK: - Currency formatter
/// - Parameters:
///   - localeIdentifier: `String` value of the preferred locale
/// - Returns: optional `String` formatted of the price in the selected local
extension Double {
	func toCurrencyString(localeIdentifier: String = Locale.current.identifier) -> String? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.locale = Locale(identifier: localeIdentifier)
		return formatter.string(from: NSNumber(value: self))
	}
}
