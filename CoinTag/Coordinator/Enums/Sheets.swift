//
//  Sheets.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation
import SwiftUI

enum Sheet: Identifiable {
	case detail
	case currencyPickerView(Binding<ExchangeCurrencies>)
	
	var id: UUID {
		UUID()
	}
}
