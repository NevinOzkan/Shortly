//
//  ApıService.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import Foundation
import Alamofire

protocol ApiServiceProtocol {
    func shortenLink(originalUrl: String, title: String, completion: @escaping (Result<[Link], Error>) -> Void)
}

enum ApiServiceError: Error {
    case networkError(internal: Error)
    case serializationError(internal: Error)
}

class ApiService: ApiServiceProtocol {
    
    private let apiKey = "cd66cde343a544318479e7d809a22b3f"
    private let baseUrl = "https://api.rebrandly.com/v1/links"
    
    func shortenLink(originalUrl: String, title: String, completion: @escaping (Result<[Link], Error>) -> Void) {
        let parameters: [String: Any] = [
            "destination": originalUrl,
            "title": title
        ]
        
        AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [
            "apikey": apiKey
        ])
        .responseData { response in
            switch response.result {
            case .success(let data):
                print("API Response: \(String(data: data, encoding: .utf8) ?? "")")
                
                let decoder = JSONDecoder()
                do {
                    // Tek bir Link dönerse
                    let link = try decoder.decode(Link.self, from: data)
                    completion(.success([link]))
                    
                    // Eğer API bir dizi döndürüyor ve JSON da diziyse
                    // let links = try decoder.decode([Link].self, from: data)
                    // completion(.success(links))
                    
                } catch {
                    print("Serialization Error: \(error.localizedDescription)")
                    completion(.failure(ApiServiceError.serializationError(internal: error)))
                }
                
            case .failure(let error):
                print("Network Error: \(error.localizedDescription)")
                completion(.failure(ApiServiceError.networkError(internal: error)))
            }
        }
    }
}
