//
//  NavView.swift
//  AutoHideMenuBar
//
//  Created by Gavin Zyonse on 2/23/24.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "apps.ipad.landscape")
                    Text("Applications")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .padding()
    }
}

#Preview {
    NavView()
}
