//
//  CatTargetType.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation
import Moya

protocol CatTargetType: DecodableTargetType {
  
}

extension CatTargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://cat-fact.herokuapp.com") else {
            assertionFailure()
            return URL(string: "")!
        }
        return url
    }
    
    var method: Moya.Method { return .get }
    
}
