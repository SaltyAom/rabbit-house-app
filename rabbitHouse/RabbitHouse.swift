//
//  RabbitHouse.swift
//  rabbitHouse
//
//  Created by saltyaom on 25/2/2565 BE.
//

import SwiftUI

@main
struct rabbitHouseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Language())
        }
    }
}
