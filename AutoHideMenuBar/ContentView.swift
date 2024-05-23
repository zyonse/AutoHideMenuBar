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
    @State private var searchText = ""

    var body: some View {
        VStack {
            List(apps, id: \.self) { app in
                HStack {
                    Image(nsImage: (app.icon ?? NSImage(systemSymbolName: "questionmark.app", accessibilityDescription: nil))!)
                    Text(app.localizedName ?? "Unknown name")
                    /*if (app.bundleIdentifier != nil) {
                        let state = getMenuBar(bundleID: app.bundleIdentifier!)
                        if (state != nil) {
                            Text(String(state!))
                        } else {
                            Text("Not set")
                        }
                    }*/
                    //Toggle("", isOn: )
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Running Apps")
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
