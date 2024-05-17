//
//  ContentView.swift
//  Auto Hide Menu Bar
//
//  Created by Gavin Zyonse on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    // Get list of apps with open windows
    private var apps = NSWorkspace.shared.runningApplications

    var body: some View {
        VStack {
            Text("TODO: Search bar")
            List(apps, id: \.self) { app in
                HStack {
                    Image(nsImage: (app.icon ?? NSImage(systemSymbolName: "questionmark.app", accessibilityDescription: nil))!)
                    Text(app.localizedName ?? "Unknown name")
                    //Toggle("", isOn: )
                }
            }
        }
        .padding()
    }
}

struct AppList: Identifiable {
    let id = UUID()
    var name: String
    var AppleMenuBarVisibleInFullscreen: Bool
}

#Preview {
    ContentView()
}
