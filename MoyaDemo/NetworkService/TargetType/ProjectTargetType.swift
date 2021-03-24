//
//  ProjectTargetType.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation
import Moya

#warning("自定義 TargetType")
protocol ProjectTargetType: TargetType {
    var parameters: [String: Any] { get }
    var tag: String { get }
}


extension ProjectTargetType {

    var headers: [String: String]? { return [:] }
    var method: Moya.Method { return .get }

    var sampleData: Data {
        if let path = Bundle.main.path(forResource: "\(type(of: self))", ofType: "json"), let data = FileHandle(forReadingAtPath: path)?.readDataToEndOfFile() {
            return data
        } else {
            assertionFailure("No mock data")
        }
        return Data()
    }

    var task: Task {
        return .requestParameters(parameters: parameters,
                                  encoding: URLEncoding(destination: .queryString))
    }

}
