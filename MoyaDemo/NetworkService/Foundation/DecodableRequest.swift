//
//  DecodableRequest.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation

protocol DecodableRequest {
    associatedtype ResponseData: Decodable
}
