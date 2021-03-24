//
//  BaseResponseModel.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation


#warning("自定義回傳 Model")
public class BaseResponseModel<T: Decodable>: Decodable {
    
    public var sysCode: Int = 0
    public var data: T?
    
    public required init() { }
}
