//
//  FullScreens.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

enum FullScreenCover: String, Identifiable {
	case detail
	
	var id: String {
		self.rawValue
	}
}
