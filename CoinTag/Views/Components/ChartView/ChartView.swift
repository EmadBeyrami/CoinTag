//
//  LineChartView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//

import SwiftUI
import Charts

struct ChartView: View {
	var dataPoint: [ChartModel]
	var chartType: ChartType = .lineMark
	
	var body: some View {
		Chart(dataPoint) {
			switch chartType {
			case .lineMark:
				LineMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title),
								 y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
				.foregroundStyle(.mint)
				if let point = $0.rulePoint {
					RuleMark(y: .value(LocalizeStrings.currentPriceValTitle.localizedValue, point))
						.foregroundStyle(.gray)
				}
			case .areaMark:
				AreaMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title),
								 y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
			case .pointMark:
				PointMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title), 
									y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
			case .rectangleMark:
				RectangleMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title),
											y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
			case .barMark:
				BarMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title), 
								y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
			}
		}
	}
	
}
