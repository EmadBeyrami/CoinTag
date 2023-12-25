//
//  Item.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
