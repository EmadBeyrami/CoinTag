//
//  CoinDetailView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2024-01-01.
//

import SwiftUI

struct CoinDetailView: View {
	
	@EnvironmentObject private var coordinator: CryptoCoordinator
	@ObservedObject private var vm: CoinDetailVM
	
	init(vm: CoinDetailVM) {
		self.vm = vm
	}
	
	var body: some View {
		VStack {
			// MARK: Header
			VStack {
				HStack {
					Image(systemName: SFSymbols.bitcoinCircle)
						.renderingMode(.original)
						.imageScale(.large)
						.foregroundColor(.cyan)
						.multilineTextAlignment(.center)
					
					Text(vm.coin.name + "(\(vm.coin.symbol))")
						.font(.title3)
						.foregroundColor(.cyan)
						.bold()
						.multilineTextAlignment(.center)
				}
				Text(vm.coin.rate)
					.font(.title3)
					.bold()
					.multilineTextAlignment(.center)
					.padding()
			}.padding()
			
			// MARK: List of aditional information
			List {
				createRow(title: LocalizeStrings.rankTitle.localized, 
									detail: "#\(vm.coin.rank)")
				createRow(title: LocalizeStrings.marketCapTitle.localized,
									detail: vm.coin.chartableQuote?.marketCap.toCurrencyString() ?? "")
				createRow(title: LocalizeStrings.circulatingSupplyTitle.localized,
									detail: vm.coin.circulatingSupply.toCurrencyString() ?? "")
			}
			Spacer()
			
			// MARK: Chart and Segment
			VStack {
				Picker(LocalizeStrings.chartTitle.localized,
							 selection: $vm.chartTimeline) {
					ForEach(ChartSegment.allCases.reversed()) { item in
						Text(item.displayName).tag(item)
					}
				}
				.pickerStyle(SegmentedPickerStyle())
				.padding()
				
				ChartView(dataPoint: vm.chartDataPoint, chartType: vm.chartType)
					.frame(height: 240)
					.padding()
			}
		}
		.navigationTitle(vm.coin.symbol)
		// MARK: navigation menu to choose charts
		.navigationBarItems(trailing: Menu {
			ForEach(ChartType.allCases) { type in
				let title = (type.displayName == vm.chartType.displayName) ? (type.displayName + " ✓") : type.displayName
				Button(title) {
					vm.chartType = type
				}
			}
		} label: {
			Image(systemName: SFSymbols.chartAccending)
				.imageScale(.large)
		}
		)
	}
	
	func createRow(title: LocalizedStringKey, detail: String) -> some View {
		HStack {
			Text(title)
				.foregroundStyle(.gray)
			Spacer()
			Text(detail)
		}
	}
}

