//
//  Coordinator.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation
import SwiftUI

@MainActor
@Observable
final class CryptoCoordinator: CoordinatorType {
	
	var themeManager = ThemeManager()
	var path = NavigationPath()
	var sheet: Sheet?
	var fullScreenCover: FullScreenCover?
	
	@ViewBuilder
	func build(page: Page) -> some View {
		switch page {
		case .home:
			MainTabbarView()
		case .coinDetail(let vm):
			CoinDetailView(vm: vm)
		case .settings:
			SettingView()
		case .coinList:
			CoinListView()
		}
	}
	
	@ViewBuilder
	func build(sheet: Sheet) -> some View {
		switch sheet {
		case .detail:
			NavigationStack {
				CoinListView()
			}
		case .currencyPickerView(let currentCurrency):
			NavigationStack {
				CurrencyPicker(selectedCurrency: currentCurrency)
			}
		}
	}
	
	@ViewBuilder
	func build(fullScreenCover: FullScreenCover) -> some View {
		switch fullScreenCover {
		case .detail:
			NavigationStack {
				CoinListView()
			}
		}
	}
}

