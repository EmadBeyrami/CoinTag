//
//  CoinListService.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

protocol HomeServiceDelegate {
	func getLatestCoins(token: String, currency: ExchangeCurrencies) async throws -> BaseModel<[Coin]>
}

struct HomeService: HTTPClient, HomeServiceDelegate {
	func getLatestCoins(token: String, currency: ExchangeCurrencies) async throws -> BaseModel<[Coin]>  {
		let response = try await sendRequest(endpoint: CoinListEndpoint.coins(token: token, exchangeCurrency: currency), httpMethod: .get, responseModel: BaseModel<[Coin]>.self)
		return response
	}
}
