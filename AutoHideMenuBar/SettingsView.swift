//
//  SettingsView.swift
//  Auto Hide Menu Bar
//
//  Created by Gavin Zyonse on 2/23/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            let app = "com.apple.Maps"
            Button("Menu bar visible in fullscreen") {
                setMenuBar(bundleID: app, state: true)
            }
            Button("Menu bar hidden in fullscreen") {
                setMenuBar(bundleID: app, state: false)
            }
            let state = getMenuBar(bundleID: app)
            Text("Current value: \(String(describing: state))")
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
