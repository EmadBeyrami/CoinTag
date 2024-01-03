//
//  CryptoItemView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-31.
//

import SwiftUI

protocol CryptoItemViewType: Priceable {
	var title: String { get }
	var rate: String { get }
}

struct CryptoItemView: View {
	
	private var model: CryptoItemViewType
	init(model: CryptoItemViewType) {
		self.model = model
	}
	
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
