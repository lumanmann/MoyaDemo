//
//  CatRouter.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation

enum CatRouter {
   
    struct Facts: CatTargetType {
        
        typealias ResponseData = CatFactsResponseModel
        
        var path: String = "/facts"
        
        var tag: String = "[200] Cat facts"
        
        var description: String = "Get cats facts"
        
        var parameters: [String : Any] = [:]

    }
    
  
}
