//
//  LineChartView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//

import SwiftUI
import Charts

struct ChartView: View {
	// MARK: - properties
	var dataPoint: [ChartModel]
	var chartType: ChartType = .lineMark
	
	// MARK: - View Body
	var body: some View {
		Chart(dataPoint) {
			switch chartType {
			// MARK: LINE MARK CHART
			case .lineMark:
				LineMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title),
								 y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
				.foregroundStyle(.mint)
				if let point = $0.rulePoint {
					RuleMark(y: .value(LocalizeStrings.currentPriceValTitle.localizedValue, point))
						.foregroundStyle(.gray)
				}
				// MARK: AREA MARK CHART
			case .areaMark:
				AreaMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title),
								 y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
				// MARK: - POINT MARK CHART
			case .pointMark:
				PointMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title), 
									y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
				// MARK: RECTANGLE MARK CHART
			case .rectangleMark:
				RectangleMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title),
											y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
				// MARK: BAR MARK CHART
			case .barMark:
				BarMark(x: .value(LocalizeStrings.timeTitle.localizedValue, $0.title), 
								y: .value(LocalizeStrings.priceTitle.localizedValue, $0.price))
					.foregroundStyle(.mint)
			}
		}
	}
	
}
