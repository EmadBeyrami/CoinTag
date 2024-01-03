//
//  Pages.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

enum Page: Identifiable, Hashable {
	case home
	case coinDetail(CoinDetailVM)
	case settings
	case coinList
	
	var id: UUID {
		UUID()
	}
}
