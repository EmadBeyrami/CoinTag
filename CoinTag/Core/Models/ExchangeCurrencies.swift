//
//  ExchangeCurrencies.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-31.
//

import Foundation

// MARK: - Exchange Currencies
// currently need only two currency exchange, USD and SEK
// can simply add more curencies later on if needed
enum ExchangeCurrencies: String, CaseIterable, Identifiable {
	
	case USD
	case SEK
	
	var id: String { self.rawValue }
	
	var flag: String {
		switch self {
		case .USD:
			return "🇺🇸"
		case .SEK:
			return "🇸🇪"
		}
	}
	
	var currencyLocale: String {
		switch self {
		case .USD:
			return "en_US"
		case .SEK:
			return "sv_SE"
		}
	}
}
