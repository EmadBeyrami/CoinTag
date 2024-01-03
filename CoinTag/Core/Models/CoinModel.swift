//
//  CoinModel.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-31.
//

import Foundation

// MARK: - Coin
struct Coin: Codable, Identifiable {
	let id: Int
	let rank: Int
	let name, symbol, slug: String
	let tags: [String]
	let circulatingSupply, totalSupply: Double
	let infiniteSupply: Bool
	let platform: Platform?
	let selfReportedCirculatingSupply, selfReportedMarketCap, tvlRatio: Double?
	var quote: [String: Quote]
	
	enum CodingKeys: String, CodingKey {
		case id, name, symbol, slug
		case rank = "cmc_rank"
		case tags
		case circulatingSupply = "circulating_supply"
		case totalSupply = "total_supply"
		case infiniteSupply = "infinite_supply"
		case platform
		case selfReportedCirculatingSupply = "self_reported_circulating_supply"
		case selfReportedMarketCap = "self_reported_market_cap"
		case tvlRatio = "tvl_ratio"
		case quote
	}
}

// MARK: - Platform
struct Platform: Codable {
	let id: Int
	let name, symbol, slug, tokenAddress: String
	
	enum CodingKeys: String, CodingKey {
		case id, name, symbol, slug
		case tokenAddress = "token_address"
	}
}

// MARK: - Quote
struct Quote: Codable {
	let price, volume24H, volumeChange24H, percentChange1H: Double
	let percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double
	let percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double
	let tvl: Double?
	
	enum CodingKeys: String, CodingKey {
		case price
		case volume24H = "volume_24h"
		case volumeChange24H = "volume_change_24h"
		case percentChange1H = "percent_change_1h"
		case percentChange24H = "percent_change_24h"
		case percentChange7D = "percent_change_7d"
		case percentChange30D = "percent_change_30d"
		case percentChange60D = "percent_change_60d"
		case percentChange90D = "percent_change_90d"
		case marketCap = "market_cap"
		case marketCapDominance = "market_cap_dominance"
		case fullyDilutedMarketCap = "fully_diluted_market_cap"
		case tvl
	}
}
