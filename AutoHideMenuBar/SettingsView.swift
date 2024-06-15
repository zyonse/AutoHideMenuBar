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
            let app = "com.apple.Notes"
            Button("Set menubar") {
                setMenuBar(bundleID: app, state: true)
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
