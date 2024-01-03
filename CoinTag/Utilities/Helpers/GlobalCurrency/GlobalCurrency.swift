//
//  GlobalCurrency.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-01.
//

import Foundation

// MARK: - Global Currency Setting
/// A Singleton in charge for holding the user selected current `Currency`
///  - Returns: `currency`  returns the current currency  as  (`ExchangeCurrencies`)
class GlobalCurrency {
	static let shared = GlobalCurrency()
	
	private init() {}
	
	var currency: ExchangeCurrencies {
		get {
			let storedValue = UserDefaults.standard.string(forKey: Keys.currentCurrency) ?? ExchangeCurrencies.SEK.rawValue
			return ExchangeCurrencies(rawValue: storedValue) ?? .SEK
		}
		set {
			UserDefaults.standard.set(newValue.rawValue, forKey: Keys.currentCurrency)
		}
	}
}
