//
//  SettingsView.swift
//  AutoHideMenuBar
//
//  Created by Gavin Zyonse on 2/23/24.
//

import SwiftUI

func setMenuBar(bundleID: String, state: Bool) {
    if let extAppDefaults = UserDefaults(suiteName: bundleID) {
        extAppDefaults.set(state, forKey: "AppleMenuBarVisibleInFullscreen")
    } else {
        print("Unable to find UserDefaults for bundleID: \(bundleID)")
    }
}

func getMenuBar(bundleID: String) -> String {
    let extAppDefaults = UserDefaults(suiteName: bundleID)
    if let state = extAppDefaults?.object(forKey: "AppleMenuBarVisibleInFullscreen") as? Bool {
        return String(state)
    } else {
        return ("Could not get state")
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            let app = "com.microsoft.VSCode"
            Button("Set menubar") {
                setMenuBar(bundleID: app, state: true)
            }
            Text("Current value: " + getMenuBar(bundleID: app))
        }

    }
}

#Preview {
    SettingsView()
}
