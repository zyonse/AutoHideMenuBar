//
//  MenuBarFuncs.swift
//  Auto Hide Menu Bar
//
//  Created by Gavin Zyonse on 5/17/24.
//

import Foundation

// Set menu bar state for an application by bundleID
func setMenuBar(bundleID: String, state: Bool) {
    CFPreferencesSetAppValue(
        "AppleMenuBarVisibleInFullscreen" as CFString,
        state as CFPropertyList,
        bundleID as CFString
    )
}

// Get current menu bar state for an application by bundleID
func getMenuBar(bundleID: String) -> Bool? {
    // Check if requested app is sandboxed
    var keyExists: DarwinBoolean = false
    
    print("~/Library/Containers/" + bundleID + "/Data/Library/Preferences/" + bundleID)
    
    let state = CFPreferencesGetAppBooleanValue(
        "AppleMenuBarVisibleInFullscreen" as CFString,
        ("/Users/zyonse/Library/Containers/" + bundleID + "/Data/Library/Preferences/" + bundleID) as CFString,
        &keyExists
    )
    if (keyExists.boolValue) {
        return state
    } else {
        return nil
    }
}
