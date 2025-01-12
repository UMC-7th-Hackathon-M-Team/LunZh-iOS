//
//  RankingModel.swift
//  LunZh
//
//  Created by 허준호 on 1/12/25.
//

import Foundation

struct RankingModel {
    let ranking: Int
    let name: String
    let menu: String
}

final class dummyRankingModel {
    static let rankingItems: [RankingModel] = [
        .init(ranking: 1, name: "에그", menu: "파스타"),
        .init(ranking: 2, name: "지누", menu: "피자"),
        .init(ranking: 3, name: "예스", menu: "리조또"),
        .init(ranking: 4, name: "주디", menu: "스테이크"),
    ]
    
}
