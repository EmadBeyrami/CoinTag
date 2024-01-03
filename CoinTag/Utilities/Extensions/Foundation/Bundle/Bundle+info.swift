//
//  Bundle+info.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-28.
//

import Foundation

// MARK: - info plist reader
extension Bundle {
		public func info(for key: String) -> String! {
				guard let value = infoDictionary?[key] else {
						return nil
				}
				return (value as! String).replacingOccurrences(of: "\\", with: "")
		}
		
		public func read(fileName: String, type: String) -> String? {
				autoreleasepool {
						if let path = self.path(forResource: fileName, ofType: type) {
								do {
										let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
										return String(data: data, encoding: .utf8)
								} catch {
										return nil
								}
						} else {
								return nil
						}
				}
		}
}
