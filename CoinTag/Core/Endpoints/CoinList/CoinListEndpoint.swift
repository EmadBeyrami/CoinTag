//
//  CoinListEndpoint.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

enum CoinListEndpoint {
	case coins(token: String, exchangeCurrency: ExchangeCurrencies)
}

extension CoinListEndpoint: Endpoint {
	
	var baseURL: String {
		guard let url = Bundle.main.info(for: InfoPlistKey.baseAPIURL) else { return "" }
		return url
	}
	
	var path: String {
		switch self {
		case .coins(_, let currency):
			return "/v1/cryptocurrency/listings/latest?convert=\(currency.rawValue)"
		}
	}
	
	var header: [String : String]? {
		switch self {
		case .coins(let token, _):
			return ["X-CMC_PRO_API_KEY" : "\(token)",
							"Accept": HTTPContentType.applicationJSON]
		}
	}
}
