//
//  ChartSegment.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//

import Foundation
enum ChartSegment: CaseIterable, Identifiable {
	case allTime
	case price1H
	case price24H
	case price7D
	case price30D
	case price60D
	case price90D
	
	var displayName: String {
		switch self {
		case .price1H:
			"1H"
		case .price24H:
			"24H"
		case .price7D:
			"7D"
		case .price30D:
			"30D"
		case .price60D:
			"60D"
		case .price90D:
			"90D"
		case .allTime:
			"All"
		}
	}
	
	var id: UUID {
		return UUID()
	}
	
	func getDataPoint(from: Quote) -> [ChartModel] {
		let currentPrice = ChartModel(title: LocalizeStrings.currentTitle.localizedValue,
																	price: from.price)
		switch self {
		case .price1H:
			return [
				ChartModel(title: self.displayName,
									 price: calculateThePrice(percentage: from.percentChange1H, of: from.price)),
				currentPrice
			]
		case .price24H:
			return [
				ChartModel(title: self.displayName,
									 price: calculateThePrice(percentage: from.percentChange24H, of: from.price)),
				currentPrice
			]
		case .price7D:
			return [
				ChartModel(title: self.displayName,
									 price: calculateThePrice(percentage: from.percentChange7D, of: from.price)),
				currentPrice
			]
		case .price30D:
			return [
				ChartModel(title: self.displayName,
									 price: calculateThePrice(percentage: from.percentChange30D, of: from.price)),
				currentPrice
			]
		case .price60D:
			return [
				ChartModel(title: self.displayName,
									 price: calculateThePrice(percentage: from.percentChange60D, of: from.price)),
				currentPrice
			]
		case .price90D:
			return [
				ChartModel(title: self.displayName,
									 price: calculateThePrice(percentage: from.percentChange90D, of: from.price)),
				currentPrice
			]
		case .allTime:
			return [
				ChartModel(title: ChartSegment.price90D.displayName,
									 price: calculateThePrice(percentage: from.percentChange90D, of: from.price)),
				ChartModel(title: ChartSegment.price60D.displayName,
									 price: calculateThePrice(percentage: from.percentChange60D, of: from.price)),
				ChartModel(title: ChartSegment.price30D.displayName,
									 price: calculateThePrice(percentage: from.percentChange30D, of: from.price)),
				ChartModel(title: ChartSegment.price7D.displayName,
									 price: calculateThePrice(percentage: from.percentChange7D, of: from.price)),
				ChartModel(title: ChartSegment.price24H.displayName,
									 price: calculateThePrice(percentage: from.percentChange24H, of: from.price)),
				ChartModel(title: ChartSegment.price1H.displayName,
									 price: calculateThePrice(percentage: from.percentChange1H, of: from.price)),
				currentPrice
			]
		}
	}
	
	private func calculateThePrice(percentage: Double, of currentPrice:Double) -> Double {
		let price = currentPrice / (1 + percentage / 100)
		print(price)
		return price
	}
}
