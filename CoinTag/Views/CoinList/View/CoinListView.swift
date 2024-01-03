//
//  CoinListView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-26.
//

import SwiftUI
import LottieUI

struct CoinListView: View {
	@Environment(\.colorScheme) private var colorScheme
	@EnvironmentObject private var coordinator: CryptoCoordinator
	@ObservedObject private var vm = CoinListViewModel(service: HomeService())
	
	var body: some View {
		NavigationView {
			ZStack {
				if vm.isLoading {
					VStack(spacing: 10) {
						LottieView(colorScheme == .light ? Lottie.coinLight : Lottie.coinDark)
							.loopMode(.loop)
							.frame(width: 130, height: 130)
					}
					.padding(.bottom, 90)
				} else {
					List{
						ForEach(vm.filteredItems, id: \.id) { item in
							CryptoItemView(model: item)
								.onTapGesture {
									coordinator.push(.coinDetail(CoinDetailVM(coin: item)))
								}
						}
					}
				}
			}
			.navigationBarTitle(LocalizeStrings.cryptosTitle.localized, displayMode: .large)
		}
		.searchable(text: $vm.search)
		.onAppear {
			getCoins()
		}
	}
	
	func getCoins() {
		Task {
			await vm.getCoins()
		}
	}
}
#Preview {
	CoinListView()
}
