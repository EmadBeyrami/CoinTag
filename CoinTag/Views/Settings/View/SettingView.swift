//
//  SettingView.swift
//  CoinTag
//
//  Created by Emad Beyrami on 2023-12-26.
//

import SwiftUI

struct SettingView: View {
	
	// MARK: - Properties
	@EnvironmentObject private var coordinator: CryptoCoordinator
	@ObservedObject var vm: SettingViewModel = SettingViewModel()
	@State private var showSettingAlert: Bool = false
	
	// MARK: - View Body
	var body: some View {
		NavigationView {
			// List of Settings
			List(SettingItems.allCases) { item in
				switch item {
				case .Currency:
					Button(action: {
						coordinator.present(sheet: .currencyPickerView($vm.current))
					}) {
						HStack {
							Text(item.displayName)
							Spacer()
							Text(vm.current.rawValue + vm.current.flag)
							Image(systemName: SFSymbols.chevronRight)
						}
					}
					.buttonStyle(.plain)
				case .Theme:
					VStack {
						HStack {
							Text(item.displayName)
							Spacer()
						}
						Picker(LocalizeStrings.themeTitle.localized,
									 selection: $coordinator.themeManager.currentTheme) {
							Text(LocalizeStrings.systemThemeTitle.localized)
								.tag(ThemeManager.ThemeSetting.system)
							Text(LocalizeStrings.lightThemeTitle.localized)
								.tag(ThemeManager.ThemeSetting.light)
							Text(LocalizeStrings.darkThemeTitle.localized)
								.tag(ThemeManager.ThemeSetting.dark)
						}.pickerStyle(SegmentedPickerStyle())
							.padding()
							.frame(height: 35)
					}
				case .Language:
					Button(action: {
						showSettingAlert = true
					}) {
						HStack {
							Text(item.displayName)
							Spacer()
							Image(systemName: SFSymbols.chevronRight)
						}
					}.buttonStyle(.plain)
				}
			}
			.navigationBarTitle(LocalizeStrings.settingTitle.localized, displayMode: .large)
			.alert(isPresented: $showSettingAlert) {
				Alert (title: Text(LocalizeStrings.langChangeTitle.localized),
							 message: Text(LocalizeStrings.langChangeMessage.localized),
							 primaryButton:
						.default(Text(LocalizeStrings.openSettingTitle.localized), action: {
							vm.openAppInSetting()
						}), secondaryButton: .default(Text(LocalizeStrings.cancelTitle.localized)))
			}
		}
	}
}

#Preview {
	SettingView()
}
