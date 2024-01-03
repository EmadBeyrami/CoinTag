//
//  Pricable.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//
import Foundation

// MARK: Priceable Protocol
/// to make it easier to call and use this currency settings, whatever conforms to this will access it right away
///  - Returns: `currentCurrency`  returns the current currency  as  (`ExchangeCurrencies`)
protocol Priceable {
	var currentCurrency: ExchangeCurrencies { get }
}

extension Priceable {
	var currentCurrency: ExchangeCurrencies {
		return GlobalCurrency.shared.currency
	}
}
