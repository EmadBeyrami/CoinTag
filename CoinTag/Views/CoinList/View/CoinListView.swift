//
//  CoinListView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-26.
//

import SwiftUI
import LottieUI

struct CoinListView: View {
	
	// MARK: - Properties
	@Environment(\.colorScheme) private var colorScheme: ColorScheme
	@EnvironmentObject private var coordinator: CryptoCoordinator
	@ObservedObject private var vm: CoinListViewModel
	@State private var showError: Bool = false
	@State private var currentError: String?
	
	// MARK: - initilizer
	init(vm: CoinListViewModel = CoinListViewModel(service: HomeService())) {
		self.vm = vm
	}
	
	// MARK: - view body
	var body: some View {
		NavigationView {
			ZStack {
				// Loading View
				if vm.isLoading {
					VStack(spacing: 10) {
						LottieView(colorScheme == .light ? Lottie.coinLight : Lottie.coinDark)
							.loopMode(.loop)
							.frame(width: 130, height: 130)
					}
					.padding(.bottom, 90)
				} else {
					// List of coins
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
		.searchable(text: $vm.search) // SearchBar
		.refreshable {
			getCoins() // Pull to refresh
		}
		.alert(isPresented: $showError) { // Error Alert
			Alert(title: Text(LocalizeStrings.errorTitle.localized),
						message: Text(currentError ?? ""))
		}
		.onAppear {
			getCoins()
		}
	}
	
	// MARK: - Methods
	func getCoins() {
		Task {
			do {
				try await vm.getCoins()
			} catch {
				currentError = error.localizedDescription
				showError = true
			}
		}
	}
	
}

#Preview {
	CoinListView()
}
