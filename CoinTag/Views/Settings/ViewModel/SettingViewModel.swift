//
//  SettingViewModel.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-03.
//

import SwiftUI

enum SettingItems: CaseIterable, Identifiable {
	case Language
	case Currency
	case Theme
	
	var id: Self { self }
	
	var displayName: LocalizedStringKey {
		switch self {
		case .Language: return LocalizeStrings.languageTitle.localized
		case .Currency: return LocalizeStrings.currencyTitle.localized
		case .Theme: 		return LocalizeStrings.themeTitle.localized
		}
	}
}

final class SettingViewModel: ObservableObject, Priceable {
	
	@Published var showingCurrencyPicker = false
	@Published var current: ExchangeCurrencies = GlobalCurrency.shared.currency
	
	func openAppInSetting() {
		UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
	}
	
}
