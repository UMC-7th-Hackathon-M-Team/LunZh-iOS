//
//  FoodDNA.swift
//  LunZh
//
//  Created by 이현주 on 1/12/25.
//

import UIKit

struct FoodDNAModel {
    let name: String
    let emoji: String
    let hexColor: String
}

extension FoodDNAModel {
    static let dummyData: [FoodDNAModel] = [
        FoodDNAModel(name: "1", emoji: "🍚", hexColor: "#B53813"),
        FoodDNAModel(name: "2", emoji: "🍚", hexColor: "#915536"),
        FoodDNAModel(name: "3", emoji: "🍚", hexColor: "#8AAB2D"),
        FoodDNAModel(name: "4", emoji: "🍚", hexColor: "#F24E1E"),
        FoodDNAModel(name: "5", emoji: "🍚", hexColor: "#915536"),
        FoodDNAModel(name: "6", emoji: "🥟", hexColor: "#915536"),
        FoodDNAModel(name: "7", emoji: "🥟", hexColor: "#EB8527"),
        FoodDNAModel(name: "8", emoji: "🥟", hexColor: "#F24E1E"),
        FoodDNAModel(name: "9", emoji: "🥟", hexColor: "#F24E1E"),
        FoodDNAModel(name: "10", emoji: "🥟", hexColor: "#E8A828"),
        FoodDNAModel(name: "11", emoji: "🍔", hexColor: "#B53813"),
        FoodDNAModel(name: "12", emoji: "🍔", hexColor: "#915536"),
        FoodDNAModel(name: "13", emoji: "🍔", hexColor: "#FFCA00"),
        FoodDNAModel(name: "14", emoji: "🍔", hexColor: "#915536"),
        FoodDNAModel(name: "15", emoji: "🍔", hexColor: "#E8A828"),
        FoodDNAModel(name: "16", emoji: "🍣", hexColor: "#FA6A09"),
        FoodDNAModel(name: "17", emoji: "🍣", hexColor: "#E8A828"),
        FoodDNAModel(name: "18", emoji: "🍣", hexColor: "#EA8527"),
        FoodDNAModel(name: "19", emoji: "🍣", hexColor: "#E8A828"),
        FoodDNAModel(name: "20", emoji: "🍣", hexColor: "#E8A828")
    ]
}
