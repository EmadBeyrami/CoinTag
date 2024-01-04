//
//  LocalizeStrings.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation
import SwiftUI

// MARK: - Localized Strings
/// All the strings which can be localized!
/// way cleaner than using `String` keys all over the place with typos
///  - Returns: `localized`  returns the key  as (`LocalizedStringKey`)
///  - Returns: `localizedValue`  returns the value directly as  (`String`)
enum LocalizeStrings: String {
	case coinsTitle 						= "COINS_TITLE"
	case settingTitle 					= "SETTING_TITLE"
	case cryptosTitle 					= "CRYPTOS_TITLE"
	case currentTitle					  = "CURRENT_TITLE"
	case rankTitle 							= "RANK_TITLE"
	case marketCapTitle 				= "MARKETCAP_TITLE"
	case circulatingSupplyTitle = "CIRCULATINGSUPPLY_TITLE"
	case chartTitle 						= "CHART_TITLE"
	case timeTitle 							= "TIME_TITLE"
	case priceTitle 						= "PRICE_TITLE"
	case currentPriceValTitle   = "CURRENT_PRICE_VALUE_TITLE"
	case systemThemeTitle 		  = "SYSTEM_THEME_TITLE"
	case lightThemeTitle 		    = "LIGHT_THEME_TITLE"
	case darkThemeTitle 			  = "DARK_THEME_TITLE"
	case themeTitle						  = "THEME_TITLE"
	case selectCurrency         = "SELECT_CURRENCY"
	case currencyTitle 	        = "CURRENCY_TITLE"
	case doneTitle 	       			= "DONE_TITLE"
	case languageTitle 				  = "LANGUAGE_TITLE"
	case coinTitle 							= "COIN_TITLE"
	case settingsTitle 					= "SETTINGS_TITLE"
	case lineChartTitle 				= "LINE_CHART_TITLE"
	case areaChartTitle 				= "AREA_CHART_TITLE"
	case pointChartTitle			  = "POINT_CHART_TITLE"
	case rectangleChartTitle	  = "RECTANGLE_CHART_TITLE"
	case barChartTitle				  = "BAR_CHART_TITLE"
	case langChangeTitle			  = "LANGUAGE_CHANGE_TITLE"
	case langChangeMessage 		  = "LANGUAGE_CHANGE_MESSAGE"
	case cancelTitle 						= "CANCEL_TITLE"
	case openSettingTitle			  = "OPEN_SETTING_TITLE"
	case errorTitle 						= "ERROR_TITLE"
	
	/// - Returns: returns the key  as (`LocalizedStringKey`)
	var localized: LocalizedStringKey {
		return LocalizedStringKey(self.rawValue)
	}
	
	///  - Returns: returns the value directly as  (`String`)
	var localizedValue: String {
		NSLocalizedString(self.rawValue, comment: "")
	}
}
