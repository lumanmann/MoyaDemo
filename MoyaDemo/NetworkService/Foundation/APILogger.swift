//
//  APILogger.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation
import Moya

protocol APILogger {
    func log<Request: ProjectTargetType>(request: Request, response: Moya.Response?, error: Error?)
}

final class DefaultAPILogger: APILogger {
    
    #if DEBUG
        let needLog: Bool = true
    #else
        let needLog: Bool = false
    #endif

    func log<Request: ProjectTargetType>(request: Request, response: Moya.Response?, error: Error?) {
        if !needLog { return }
        
        let tag = "\(request.tag)"
        let currentTime = "\ncurrentTime: \(Date())"
        let url = "\nurl:\t\t" + request.baseURL.absoluteString + request.path
        let headers = "\nheaders:\t\(request.headers)"
        let parametersStr = "\nparameters:\t\(request.parameters)"

        var log = tag + url + headers + parametersStr + currentTime
        if let response = response {
            let responseData = response.data
            log += "\n🧠response:\n\(String(data: responseData, encoding: .utf8))"
        }
        
        if let error = error {
            log += "\n👁error:\n" + error.localizedDescription
        }
        
        print("-------")
        print(log)
        print("-------")
       
    }
    
    
  
}

