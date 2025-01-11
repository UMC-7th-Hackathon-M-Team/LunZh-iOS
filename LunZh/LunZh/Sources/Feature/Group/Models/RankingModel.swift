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
        .init(ranking: 1, name: "김치", menu: "김치"),
        .init(ranking: 2, name: "치즈", menu: "치즈"),
        .init(ranking: 3, name: "피자", menu: "피자"),
        .init(ranking: 4, name: "치킨", menu: "치킨"),
    ]
    
}
