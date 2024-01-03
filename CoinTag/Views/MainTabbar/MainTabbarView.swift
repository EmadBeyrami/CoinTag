//
//  MainTabbarView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-26.
//

import SwiftUI

struct MainTabbarView: View {
	@EnvironmentObject private var coordinator: CryptoCoordinator
	
	var body: some View {
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
