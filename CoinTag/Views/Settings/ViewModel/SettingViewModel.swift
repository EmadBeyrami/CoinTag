//
//  SettingViewModel.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-03.
//

import SwiftUI

// MARK: - SettingItems
// representing all the items in the setting list
enum SettingItems: CaseIterable, Identifiable {
	// setting Items
	case Language
	case Currency
	case Theme
	
	var id: Self { self }
	
	// returns Human readable names of items
	var displayName: LocalizedStringKey {
		switch self {
		case .Language: return LocalizeStrings.languageTitle.localized
		case .Currency: return LocalizeStrings.currencyTitle.localized
		case .Theme: 		return LocalizeStrings.themeTitle.localized
		}
	}
}

// MARK: - SettingViewModel
final class SettingViewModel: ObservableObject, Priceable {
	
	// MARK: - Properties
	@Published var showingCurrencyPicker = false
	@Published var current: ExchangeCurrencies = GlobalCurrency.shared.currency
	
	// MARK: - Methods
	// opens the app setting in the phone
	func openAppInSetting() {
		UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
	}
	
}
