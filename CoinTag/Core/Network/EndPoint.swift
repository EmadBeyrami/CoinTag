//
//  EndPoint.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

public protocol Endpoint {
		var baseURL:   String            { get }
		var path:      String            { get }
		var header:    [String: String]? { get }
}
