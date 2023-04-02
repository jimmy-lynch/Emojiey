//
//  Emoji.swift
//  Emojey
//
//  Created by Jimmy Lynch on 3/30/23.
//

import Foundation

struct Emoji: Codable, Identifiable {
    let emoji: String
    let description: String
    let category: String
    let aliases: [String]
    let tags: [String]
    let unicode_version: String
    let ios_version: String
    
    var id: String {
        emoji
    }
}
