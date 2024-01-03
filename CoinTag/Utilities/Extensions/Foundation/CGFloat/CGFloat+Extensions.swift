//
//  CGFloat+Extensions.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-03.
//

import Foundation

public extension CGFloat {
	/// Grid multiplier for padding.
	static func grid(_ n: Int) -> Self { Self(n) * 4.0 }
}
