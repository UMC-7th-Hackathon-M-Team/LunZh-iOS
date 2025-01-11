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
    let imageName: String
}

extension FoodDNAModel {
    static let dummyData: [FoodDNAModel] = [
        FoodDNAModel(name: "김치찌개", emoji: "🍚", hexColor: "#B53813", imageName: "food1"),
        FoodDNAModel(name: "불고기", emoji: "🍚", hexColor: "#915536", imageName: "food2"),
        FoodDNAModel(name: "비빔밥", emoji: "🍚", hexColor: "#8AAB2D", imageName: "food3"),
        FoodDNAModel(name: "떡볶이", emoji: "🍚", hexColor: "#F24E1E", imageName: "4"),
        FoodDNAModel(name: "삼겹살", emoji: "🍚", hexColor: "#915536", imageName: "5"),
        FoodDNAModel(name: "짜장면", emoji: "🥟", hexColor: "#915536", imageName: "6"),
        FoodDNAModel(name: "탕수육", emoji: "🥟", hexColor: "#EB8527", imageName: "7"),
        FoodDNAModel(name: "짬뽕", emoji: "🥟", hexColor: "#F24E1E", imageName: "8"),
        FoodDNAModel(name: "마파두부", emoji: "🥟", hexColor: "#F24E1E", imageName: "9"),
        FoodDNAModel(name: "볶음밥", emoji: "🥟", hexColor: "#E8A828", imageName: "10"),
        FoodDNAModel(name: "파스타", emoji: "🍔", hexColor: "#B53813", imageName: "11"),
        FoodDNAModel(name: "피자", emoji: "🍔", hexColor: "#915536", imageName: "12"),
        FoodDNAModel(name: "햄버거", emoji: "🍔", hexColor: "#FFCA00", imageName: "13"),
        FoodDNAModel(name: "스테이크", emoji: "🍔", hexColor: "#915536", imageName: "14"),
        FoodDNAModel(name: "리조또", emoji: "🍔", hexColor: "#E8A828", imageName: "15"),
        FoodDNAModel(name: "스시", emoji: "🍣", hexColor: "#FA6A09", imageName: "16"),
        FoodDNAModel(name: "라멘", emoji: "🍣", hexColor: "#E8A828", imageName: "17"),
        FoodDNAModel(name: "돈카츠", emoji: "🍣", hexColor: "#EA8527", imageName: "18"),
        FoodDNAModel(name: "우동", emoji: "🍣", hexColor: "#E8A828", imageName: "19"),
        FoodDNAModel(name: "오코노미야끼", emoji: "🍣", hexColor: "#E8A828", imageName: "20")
    ]
    
    static let selectDummyData: [FoodDNAModel] = [
        FoodDNAModel(name: "김치찌개", emoji: "🍚", hexColor: "#B53813", imageName: "food1"),
        FoodDNAModel(name: "불고기", emoji: "🍚", hexColor: "#915536", imageName: "food2"),
        FoodDNAModel(name: "삼겹살", emoji: "🍚", hexColor: "#915536", imageName: "5"),
        FoodDNAModel(name: "스테이크", emoji: "🍔", hexColor: "#915536", imageName: "14"),
        FoodDNAModel(name: "돈카츠", emoji: "🍣", hexColor: "#EA8527", imageName: "18")
    ]
}
