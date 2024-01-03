//
//  CoinListViewModel.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation
import Observation

final class CoinListViewModel: ObservableObject, Priceable {
	
	@Published private(set) var isLoading: Bool = false
	@Published private var coins: [Coin] = []
	private var service: HomeServiceDelegate = HomeService()
	private var token: String?
	
	@Published var search: String = ""
	var filteredItems: [Coin] {
		if search.isEmpty {
			return coins
		} else {
			let keyword = search.lowercased()
			return coins.filter { item in
				item.name.lowercased().contains(keyword) || item.symbol.lowercased().contains(keyword)
			}
		}
	}
	
	init(service: HomeServiceDelegate) {
		self.service = service
		self.token = Keychain.shared.load(withKey: Keys.accessToken)
	}
	
	@MainActor
	func getCoins() async {
		guard let token = token else { return }
		isLoading = true
		do {
			let result = try await service.getLatestCoins(token: token, currency: currentCurrency)
			DispatchQueue.main.async { [weak self] in
				guard let self = self else { return }
				coins = result.data
				isLoading = false
			}
		}
		catch {
#if DEBUG
			print(error)
#endif
			DispatchQueue.main.async { [weak self] in
				self?.isLoading = false
			}
		}
	}
}


extension Coin: CryptoItemViewType {
	var title: String {
		return self.name
	}
	
	var rate: String {
		if let coinRate = self.quote.first(where: {$0.key == currentCurrency.rawValue}),
			 let price = coinRate.value.price.toCurrencyString(localeIdentifier: currentCurrency.currencyLocale) {
			return price
		} else {
			return ""
		}
	}
}
