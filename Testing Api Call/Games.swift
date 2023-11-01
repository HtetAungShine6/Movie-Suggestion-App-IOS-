//
//  Game.swift
//  Testing Api Call
//
//  Created by Akito Daiki on 25/10/2566 BE.
//

import Foundation

struct Game: Codable, Identifiable{
    let id = UUID()
    var title: String
    var normalPrice: String
    var salePrice: String
    var steamRatingPercent: String
    var thumb: String
}
