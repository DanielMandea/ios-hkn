//
//  Item.swift
//  HKN (iOS)
//
//  Created by Daniel on 28.01.2021.
//

import Foundation

struct Item: Codable, Identifiable {
    var by: String? = nil
    var descendants: Int? = nil
    var id: Int? = nil
    var kids: [Int]? = nil
    var score: Int? = nil
    var time: Date? = nil
    var title: String? = nil
    var text: String? = nil
    var type: String? = nil
    var url : String? = nil
}
