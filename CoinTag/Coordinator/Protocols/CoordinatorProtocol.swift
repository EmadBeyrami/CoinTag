//
//  CoordinatorProtocol.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation
import SwiftUI

// MARK: - Coordinator Type
/// Defines Coordinator basic needs
@MainActor
protocol CoordinatorType: ObservableObject {
	/// path to navigate through pages
	var path: NavigationPath { get set }
	/// sheet to handle sheet views
	var sheet: Sheet? { get set }
	/// fullScreenCover to handle fullscreen views
	var fullScreenCover: FullScreenCover? { get set }
	/// Theme Color Manager
	var themeManager: ThemeManager { get set }
	
	// MARK: - Methods
	/// basic navigation methods
	func push(_ page: Page)
	func present(sheet: Sheet)
	func present(fullScreenCover: FullScreenCover)
	func pop()
	func popToRoot()
	func dismissSheet()
}

// MARK: - Coordinator Type Implementations
/// implements basic functionality in order to avoid boiler plate
extension CoordinatorType {
	
	func push(_ page: Page) {
		path.append(page)
	}
	
	func present(sheet: Sheet) {
		self.sheet = sheet
	}
	
	func present(fullScreenCover: FullScreenCover) {
		self.fullScreenCover = fullScreenCover
	}
	
	func pop() {
		path.removeLast()
	}
	
	func popToRoot() {
		path.removeLast(path.count)
	}
	
	func dismissSheet() {
		self.sheet = nil
	}
	
	func dismissFullScreenCover() {
		self.fullScreenCover = nil
	}
	
}
