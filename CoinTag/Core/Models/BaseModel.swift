//
//  BaseModel.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

// MARK: - BaseModel
/// All the requests will respond by this model
struct BaseModel<M: Codable>: Codable {
	let status: Status
	let data: M
}

// MARK: - Status
// Status information
struct Status: Codable {
	let errorCode: Int
	let errorMessage: String?
	let totalCount: Int
	
	enum CodingKeys: String, CodingKey {
		case errorCode = "error_code"
		case errorMessage = "error_message"
		case totalCount = "total_count"
	}
}
