//
//  CryptoItemView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-31.
//

import SwiftUI

// MARK: - CryptoItemViewType
// to make this component generic
protocol CryptoItemViewType: Priceable {
	var title: String { get }
	var rate: String { get }
}

// MARK: - CryptoItemView
struct CryptoItemView: View {
	// MARK: - properties
	private var model: CryptoItemViewType
	
	// MARK: - Initilizer
	init(model: CryptoItemViewType) {
		self.model = model
	}
	
	// MARK: - View Body
	var body: some View {
		HStack {
			Image(systemName: SFSymbols.bitcoinCircle)
			Text(model.title)
			Spacer()
			Text(model.rate)
			Image(systemName: SFSymbols.chevronRight)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		
	}
}
