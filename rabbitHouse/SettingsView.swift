//
//  SettingsView.swift
//  rehello
//
//  Created by saltyaom on 26/2/2565 BE.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject
    var language: Language
            
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Language", selection: $language.value) {
                        ForEach(languages, id: \.self) { lang in
                            Text(lang)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Language())
    }
}
