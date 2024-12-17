//
//  ApıService.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import Foundation
import Alamofire

protocol ApiServiceProtocol {
    func fetchLinks(completion: @escaping (Result<[Link], Error>) -> Void)
}

enum ApiServiceError: Error {
    case networkError(internal: Error)
    case serializationError(internal: Error)
}

class ApıService: ApiServiceProtocol {
    
    private let apiKey = "20b940be115047e2aa49580e0a4d68d4"
    private let baseUrl = "https://api.rebrandly.com/v1/links"
    
    func fetchLinks(completion: @escaping (Result<[Link], Error>) -> Void) {
            let url = "\(baseUrl)?apikey=\(apiKey)"
        
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let links = try decoder.decode([Link].self, from: data)
                        completion(.success(links))
                    } catch {
                        completion(.failure(ApiServiceError.serializationError(internal: error)))
                    }
                case .failure(let error):
                    completion(.failure(ApiServiceError.networkError(internal: error)))
                }
            }
        }
    }
