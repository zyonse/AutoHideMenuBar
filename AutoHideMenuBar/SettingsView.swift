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
            let app = "com.microsoft.VSCode"
            Button("Set menubar") {
                setMenuBar(bundleID: app, state: true)
            }
            let state = getMenuBar(bundleID: "/Users/zyonse/Library/Containers/com.apple.Maps/Data/Library/Preferences/com.apple.Maps")
            if (state != nil) {
                Text("Current value: \(state!)")
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
