//
//  ContentView.swift
//  rehello
//
//  Created by saltyaom on 25/2/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RabbitHouseView()
                .tabItem {
                    Label("Menu", systemImage: "menucard")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Language())
    }
}
