//
//  MenuView.swift
//  rehello
//
//  Created by saltyaom on 26/2/2565 BE.
//

import SwiftUI

struct MenuView: View {
    var title: String
    var menus: [RabbitMenu]

    var body: some View {
        List {
            ForEach(menus, id: \.name.en) { menu in
                MenuItem(menu)
            }
        }
        .navigationTitle(Text(title))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(title: "Coffee", menus: [])
            .environmentObject(Language())
    }
}
