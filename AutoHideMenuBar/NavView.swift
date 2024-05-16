//
//  NavView.swift
//  AutoHideMenuBar
//
//  Created by Gavin Zyonse on 2/23/24.
//

import SwiftUI

enum Tab: Hashable {
    case apps
    case settings
}

struct NavView: View {
    @State private var activeTab: Tab? = .apps
    
    var body: some View {
        NavigationSplitView {
            List(selection: $activeTab) {
                NavigationLink(value: Tab.apps) {
                    Label("Apps", systemImage: "list.bullet.rectangle")
                }
                
                NavigationLink(value: Tab.settings) {
                    Label("Settings", systemImage: "gear")
                }
            }
        } detail: {
            switch activeTab {
            case .apps: ContentView()
            case .settings: SettingsView()
            case .none:
                Text("Select a tab")
            }
        }
    }
}

#Preview {
    NavView()
}
