//
//  MenuItem.swift
//  rehello
//
//  Created by saltyaom on 26/2/2565 BE.
//

import SwiftUI

class Intl {
    init(_ menu: RabbitMenu) {
        English = Translated(title: menu.name.en, sub: menu.name.jp, formatter: "$%.2f", price: menu.price.usd)

        Japanese = Translated(title: menu.name.jp, sub: menu.name.en, formatter: "¥%d", price: menu.price.jpy)
    }
    
    let English, Japanese: Translated

    func by(_ key: String) -> Translated {
        switch key {
            case "English": return English
            case "Japanese": return Japanese
            default: return English
        }
    }
}

class Translated {
    init(title: String, sub: String, formatter: String, price: Double) {
        self.title = title
        self.sub = sub
        self.formatter = formatter
        self.price = price
    }
    
    let title, sub, formatter: String
    let price: Double
}

struct MenuItem: View {
    @EnvironmentObject
    var language: Language
    
    var menu: RabbitMenu
    
    let intl: Intl?
    
    init(_ menu: RabbitMenu) {
        intl = Intl(menu)
        self.menu = menu
    }

    var body: some View {
        VStack {
            HStack {
                Text(language.value == "English" ? menu.name.jp : menu.name.en)
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
                Spacer()
            }
            Spacer()
                .frame(height: 8.0)
            HStack {
                Text(language.value == "English" ? menu.name.en : menu.name.jp)
                Spacer()
                Text(String(format: language.value == "English" ? "$%.2f" : "¥%.2f", language.value == "English" ? menu.price.usd : menu.price.jpy))
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(RabbitMenu(
            name: RabbitName(
                en: "Rabbit House",
                jp: "Rabbit House"
            ),
            price: RabbitPrice(
                usd: 3.99,
                jpy: 400
            )
        ))
            .environmentObject(Language())
    }
}
