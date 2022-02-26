//
//  language.swift
//  rehello
//
//  Created by saltyaom on 26/2/2565 BE.
//

import Foundation

var languages = ["English", "日本語"]

class Language: ObservableObject {
    private let preferences = UserDefaults.standard

    init() {
        if let persisted = preferences.string(forKey: "language") {
            value = persisted
        } else {
            value = languages[0]
        }
    }
    
    @Published
    var value: String {
        didSet {
            preferences.set(value, forKey: "language")
        }
    }
}
