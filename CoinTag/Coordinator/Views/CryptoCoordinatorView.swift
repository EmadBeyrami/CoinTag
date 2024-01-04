//
//  CryptoCoordinatorView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation
import SwiftUI

struct CryptoCoordinatorView: View {
	// MARK: - Properties
	@StateObject private var coordinator = CryptoCoordinator()
	
	// MARK: - View Body
	var body: some View {
		NavigationStack(path: $coordinator.path) {
			coordinator.build(page: .home)
				.navigationDestination(for: Page.self) { page in
					coordinator.build(page: page)
				}
				.sheet(item: $coordinator.sheet) { sheet in
					coordinator.build(sheet: sheet)
				}
				.fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
					coordinator.build(fullScreenCover: fullScreenCover)
				}
		}
		.environmentObject(coordinator)
		.preferredColorScheme(coordinator.themeManager.colorScheme)
	}
}
