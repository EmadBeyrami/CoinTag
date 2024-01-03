//
//  CoinTagApp.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-25.
//

import SwiftUI
import SwiftData

@main
struct CoinTagApp: App {
	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			Item.self,
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
		
		do {
			return try ModelContainer(for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()
	
	// MARK: - First Lunch Checker
	private func isFirstLaunch() -> Bool {
		let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "HasLaunchedBefore")
		return !hasLaunchedBefore
	}
	
	init() {
		if isFirstLaunch() {
			// Perform your first-time launch actions here
#if DEBUG
			print("This is the first launch of the app")
#endif
			/// I wanted to save the API Token from XCConfig to Keychain to keep it safe
			/// so I just do that at the first lunch of the app
			if let token = Bundle.main.info(for: InfoPlistKey.APIAccessToken) {
				Keychain.shared.save(token, forKey: Keys.accessToken)
			}
			
			// Set the flag to indicate that the first launch actions have been performed
			UserDefaults.standard.set(true, forKey: "HasLaunchedBefore")
		}
	}
	
	var body: some Scene {
		WindowGroup {
			CryptoCoordinatorView()
		}
		.modelContainer(sharedModelContainer)
	}
}
