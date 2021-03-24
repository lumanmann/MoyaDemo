//
//  CatFactsResponseModel.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation

typealias CatFactsResponseModel = [CatResponseElement]

struct CatResponseElement: Codable {
    let status: Status
    let type: String
    let deleted: Bool
    let id, user, text: String
    let v: Int
    let source, updatedAt, createdAt: String
    let used: Bool

    enum CodingKeys: String, CodingKey {
        case status, type, deleted
        case id = "_id"
        case user, text
        case v = "__v"
        case source, updatedAt, createdAt, used
    }
}

// MARK: - Status
struct Status: Codable {
    let verified: Bool
    let sentCount: Int
}
