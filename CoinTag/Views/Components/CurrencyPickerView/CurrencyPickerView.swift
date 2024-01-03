//
//  CurrencyPickerView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-03.
//

import SwiftUI

struct CurrencyPicker: View {
	
	@EnvironmentObject private var coordinator: CryptoCoordinator
	@Binding var selectedCurrency: ExchangeCurrencies
	
	var body: some View {
		NavigationView {
			VStack {
				Spacer()
				Text(LocalizeStrings.selectCurrency.localized)
					.fontWeight(.heavy)
					.multilineTextAlignment(.center)
					.font(.title)
				Picker(LocalizeStrings.selectCurrency.localized,
							 selection: $selectedCurrency) {
					ForEach(ExchangeCurrencies.allCases) { currency in
						Text(currency.rawValue + currency.flag).tag(currency)
							.multilineTextAlignment(.center)
							.font(.title2)
					}
				}
				.pickerStyle(.wheel)
				.navigationBarTitle(LocalizeStrings.currencyTitle.localized,
														displayMode: .large)
				Spacer()
				Button(LocalizeStrings.doneTitle.localized) {
					GlobalCurrency.shared.currency = selectedCurrency
					coordinator.dismissSheet()
				}.buttonStyle(PrimaryButtonStyle())
			}.padding()
		}
	}
}
