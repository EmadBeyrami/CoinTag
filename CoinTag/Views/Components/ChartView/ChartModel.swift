//
//  ChartModel.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-02.
//

import Foundation
import SwiftUI

protocol ChartViewType: Identifiable {
	var id: UUID { get }
	var title: String { get set }
	var price: Double { get set }
	var rulePoint: Double? { get set }
}
extension ChartViewType {
	var id: UUID {
		return UUID()
	}
}

struct ChartModel: ChartViewType {
	var title: String
	var price: Double
	var rulePoint: Double?
}

enum ChartType: String, CaseIterable, Identifiable {
	case lineMark
	case areaMark
	case pointMark
	case rectangleMark
	case barMark
	
	var id: String {
		self.rawValue
	}
	
	var displayName: String {
		switch self {
		case .lineMark:
			return LocalizeStrings.lineChartTitle.localizedValue
		case .areaMark:
			return LocalizeStrings.areaChartTitle.localizedValue
		case .pointMark:
			return LocalizeStrings.pointChartTitle.localizedValue
		case .rectangleMark:
			return LocalizeStrings.rectangleChartTitle.localizedValue
		case .barMark:
			return LocalizeStrings.barChartTitle.localizedValue
		}
	}
}
