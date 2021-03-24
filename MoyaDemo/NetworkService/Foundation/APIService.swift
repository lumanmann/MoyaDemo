//
//  APIServiceProtocol.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-24.
//

import Foundation
import Moya

final class APIService {
    
    static let shared = APIService()

    private let provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>()
    private lazy var mockProvider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider<MultiTarget>.delayedStub(3))
    
    private let logger: APILogger = DefaultAPILogger()
    private let decoder: JSONDecoder = JSONDecoder()
    
    func request<Request: DecodableTargetType>(_ request: Request, isMock: Bool = isAllMock,
                                           completion: @escaping ((Swift.Result<Request.ResponseData?,
        Error>) -> Void)) {

        let target = MultiTarget.init(request)
        let reqProvider = isMock ? mockProvider:provider
        
        reqProvider.request(target) { [weak self](result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    let responseResult = try self.decoder.decode(Request.ResponseData.self, from: response.data)
                    self.logger.log(request: request, response: response, error: nil)
                    completion(.success(responseResult))
                } catch  let error {
                    self.logger.log(request: request, response: response, error: error)
                    completion(.failure(error))
                }
            case .failure(let error):
                self.logger.log(request: request, response: nil, error: error)
                completion(.failure(error))
            }
        }
    }
    
}
