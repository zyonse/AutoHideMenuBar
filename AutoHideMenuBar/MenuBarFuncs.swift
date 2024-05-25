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
    
    if let extAppDefaults = UserDefaults(suiteName: bundleID) {
        extAppDefaults.set(state, forKey: "AppleMenuBarVisibleInFullscreen")
    } else {
        print("Unable to find UserDefaults for bundleID: \(bundleID)")
    }
}

// Get current menu bar state for an application by bundleID
func getMenuBar(bundleID: String) -> Bool? {
    if let urls = getPreferencesFileURLs(forBundleID: bundleID) {
        for url in urls {
            print("Preferences file URL: \(url)")
        }
    } else {
        print("Preferences file URLs not found.")
    }
    
    var keyExists: DarwinBoolean = false
    
    let state = CFPreferencesGetAppBooleanValue(
        "AppleMenuBarVisibleInFullscreen" as CFString,
        bundleID as CFString,
        &keyExists
    )
    if (keyExists.boolValue) {
        return state
    } else {
        return nil
    }
}

// Declare the external function
@_silgen_name("_CFPreferencesCopyApplicationMap")
func _CFPreferencesCopyApplicationMap(_ userName: CFString, _ hostName: CFString) -> CFDictionary?

func getPreferencesFileURLs(forBundleID bundleID: String) -> [URL]? {
    // Obtain the application map dictionary
    guard let applicationMap = _CFPreferencesCopyApplicationMap(kCFPreferencesCurrentUser, kCFPreferencesAnyHost) as? [String: AnyObject] else {
        return nil
    }
    
    print(applicationMap)
    
    // Obtain the array of URLs for the specified bundle ID
    guard let urls = applicationMap[bundleID] as? [CFURL] else {
        return nil
    }
    
    // Convert CFURL array to URL array
    let urlArray = urls.map { $0 as URL }
    
    return urlArray
}
