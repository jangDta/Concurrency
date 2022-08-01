//
//  Info.swift
//  Concurrency
//
//  Created by 장용범 on 2022/08/01.
//

import Foundation

// MARK: - Info

struct Info: Codable {
    let synopsis, yearsAired: String
    let genres: [String]
    let creators: [Creator]
    let id: Int
}

// MARK: - Creator

struct Creator: Codable {
    let name: String
    let url: String
}
