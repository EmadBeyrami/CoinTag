//
//  PrimaryButtonModifier.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-03.
//

import SwiftUI

// MARK: - Primary Button Modifier
struct PrimaryButtonStyle: ButtonStyle {
	@Environment(\.colorScheme) var colorScheme
	
	init() {}
	
	func makeBody(configuration: Configuration) -> some View {
		configuration
			.label
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 20)
			.padding(.grid(4))
			.foregroundColor(colorScheme == .dark ? .black : .white) // Text color
			.background(colorScheme == .dark ? Color.white : Color.black) // Background color
			.cornerRadius(10)
	}
}
