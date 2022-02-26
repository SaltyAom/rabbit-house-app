//
//  rehelloApp.swift
//  rehello
//
//  Created by saltyaom on 25/2/2565 BE.
//

import SwiftUI

@main
struct rehelloApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Language())
        }
    }
}
