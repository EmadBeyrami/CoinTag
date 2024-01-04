//
//  MainTabbarView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-26.
//

import SwiftUI

struct MainTabbarView: View {
	// MARK: - Properties
	@EnvironmentObject private var coordinator: CryptoCoordinator
	
	// MARK: - View Body
	var body: some View {
		// MARK: TabView
		TabView {
			// First tab content
			CoinListView()
				.tabItem {
					Image(systemName: SFSymbols.bitcoinCircle)
					Text(LocalizeStrings.coinTitle.localized)
				}
			
			// Second tab content
			SettingView()
				.tabItem {
					Image(systemName: SFSymbols.gearCircle)
					Text(LocalizeStrings.settingTitle.localized)
				}
		}
	}
}

#Preview {
	MainTabbarView()
		.modelContainer(for: Item.self, inMemory: true)
}
