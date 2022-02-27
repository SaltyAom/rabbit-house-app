//
//  RabbitHouseMenu.swift
//  rabbitHouse
//
//  Created by saltyaom on 26/2/2565 BE.
//

import Foundation

// MARK: - RabbitHouse
struct RabbitHouse: Codable {
    let coffee, straightCoffee, arrangeCoffee, others, food: [RabbitMenu]

    enum CodingKeys: String, CodingKey {
        case coffee
        case straightCoffee = "straight coffee"
        case arrangeCoffee = "arrange coffee"
        case others, food
    }
}

extension RabbitHouse {
    func byKey(_ name: String) -> [RabbitMenu] {
        switch name {
            case "coffee": return coffee
            case "straight coffee": return straightCoffee
            case "arrange cofee": return arrangeCoffee
            case "others": return others
            case "food": return food
            default: return coffee
        }
    }
    
    func formatKey(_ name: String) -> String {
        switch name {
            case "straightCoffee": return "straight coffee"
            case "arrangeCoffee": return "arrange coffee"
            default: return name
        }
    }
}

// MARK: - ArrangeCoffee
struct RabbitMenu: Codable {
    let name: RabbitName
    let price: RabbitPrice
}

// MARK: - Name
struct RabbitName: Codable {
    let en, jp: String
}

// MARK: - Price
struct RabbitPrice: Codable {
    let usd, jpy: Double
}
