//
//  ThemeManager.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-01.
//

import SwiftUI
import Observation

// MARK: - Theme Manager
/// This Class is responsible for storing and fetching  user preferred theme setting
@MainActor
@Observable
class ThemeManager {
	enum ThemeSetting: String {
		case system
		case light
		case dark
	}
	
	var currentTheme: ThemeSetting {
		didSet {
			UserDefaults.standard.set(currentTheme.rawValue, forKey: Keys.theme)
		}
	}
	
	var colorScheme: ColorScheme? {
		switch currentTheme {
		case .light:
			return .light
		case .dark:
			return .dark
		case .system:
			return nil
		}
	}
	
	init() {
		let storedTheme = UserDefaults.standard.string(forKey: Keys.theme) ?? ThemeSetting.system.rawValue
		currentTheme = ThemeSetting(rawValue: storedTheme) ?? .system
	}
}
