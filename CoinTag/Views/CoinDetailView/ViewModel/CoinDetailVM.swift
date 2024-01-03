//
//  CoinDetailVM.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//

import Foundation

protocol CoinDetailVMType: Hashable {
	var coin: Coin { get set }
	var chartType: ChartType { get set }
	var chartTimeline: ChartSegment { get set }
	var chartDataPoint: [ChartModel] { get set }
}

extension CoinDetailVMType {
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.coin.id == rhs.coin.id &&
		lhs.chartTimeline.id == rhs.chartTimeline.id &&
		lhs.chartDataPoint.count == rhs.chartDataPoint.count
	}
	func hash(into hasher: inout Hasher) {
		hasher.combine(coin.id)
		hasher.combine(chartType.id)
		hasher.combine(chartTimeline.id)
		hasher.combine(chartDataPoint.count)
	}
}

final class CoinDetailVM: CoinDetailVMType, ObservableObject {
	
	var coin: Coin
	init(coin: Coin) {
		self.coin = coin
		self.chartTimeline = .allTime
	}
	
	@Published var chartDataPoint: [ChartModel] = []
	@Published var chartType: ChartType = .lineMark
	@Published var chartTimeline: ChartSegment = .allTime {
		didSet {
			guard let chartableQuote = coin.chartableQuote else { return }
			chartDataPoint = chartTimeline.getDataPoint(from: chartableQuote)
		}
	}
	
}

protocol ChartableQouteType {
	var chartableQuote: Quote? { get }
}

extension Coin: ChartableQouteType {
	var chartableQuote: Quote? {
		if let coinRate = self.quote.first(where: {$0.key == currentCurrency.rawValue}) {
			return coinRate.value
		}
		return nil
	}
}
