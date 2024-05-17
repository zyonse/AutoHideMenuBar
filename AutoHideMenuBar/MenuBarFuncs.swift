//
//  MenuBarFuncs.swift
//  Auto Hide Menu Bar
//
//  Created by Gavin Zyonse on 5/17/24.
//

import Foundation

// Set menu bar state for an application by bundleID
func setMenuBar(bundleID: String, state: Bool) {
    if let extAppDefaults = UserDefaults(suiteName: bundleID) {
        extAppDefaults.set(state, forKey: "AppleMenuBarVisibleInFullscreen")
    } else {
        print("Unable to find UserDefaults for bundleID: \(bundleID)")
    }
}

// Get current menu bar state for an application by bundleID
func getMenuBar(bundleID: String) -> String {
    let extAppDefaults = UserDefaults(suiteName: bundleID)
    if let state = extAppDefaults?.object(forKey: "AppleMenuBarVisibleInFullscreen") as? Bool {
        return String(state)
    } else {
        return ("Could not get state")
    }
}
