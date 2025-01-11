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
        FoodDNAModel(name: "김치찌개", emoji: "🍚", hexColor: "#B53813"),
        FoodDNAModel(name: "불고기", emoji: "🍚", hexColor: "#915536"),
        FoodDNAModel(name: "비빔밥", emoji: "🍚", hexColor: "#8AAB2D"),
        FoodDNAModel(name: "떡볶이", emoji: "🍚", hexColor: "#F24E1E"),
        FoodDNAModel(name: "삼겹살", emoji: "🍚", hexColor: "#915536"),
        FoodDNAModel(name: "짜장면", emoji: "🥟", hexColor: "#915536"),
        FoodDNAModel(name: "탕수육", emoji: "🥟", hexColor: "#EB8527"),
        FoodDNAModel(name: "짬뽕", emoji: "🥟", hexColor: "#F24E1E"),
        FoodDNAModel(name: "마파두부", emoji: "🥟", hexColor: "#F24E1E"),
        FoodDNAModel(name: "볶음밥", emoji: "🥟", hexColor: "#E8A828"),
        FoodDNAModel(name: "파스타", emoji: "🍔", hexColor: "#B53813"),
        FoodDNAModel(name: "피자", emoji: "🍔", hexColor: "#915536"),
        FoodDNAModel(name: "햄버거", emoji: "🍔", hexColor: "#FFCA00"),
        FoodDNAModel(name: "스테이크", emoji: "🍔", hexColor: "#915536"),
        FoodDNAModel(name: "리조또", emoji: "🍔", hexColor: "#E8A828"),
        FoodDNAModel(name: "스시", emoji: "🍣", hexColor: "#FA6A09"),
        FoodDNAModel(name: "라멘", emoji: "🍣", hexColor: "#E8A828"),
        FoodDNAModel(name: "돈카츠", emoji: "🍣", hexColor: "#EA8527"),
        FoodDNAModel(name: "우동", emoji: "🍣", hexColor: "#E8A828"),
        FoodDNAModel(name: "오코노미야끼", emoji: "🍣", hexColor: "#E8A828")
    ]
}
