//
//  RequestError.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

public enum RequestError: Error {
		case decode
		case invalidURL
		case noResponse
		case notFound
		case unauthorized(Data)
		case unexpectedStatusCode(Int)
		case unknown(String)
}
