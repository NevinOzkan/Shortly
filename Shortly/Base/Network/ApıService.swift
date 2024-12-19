//
//  ApıService.swift
//  Shortly
//
//  Created by Nevin Özkan on 18.12.2024.
//

import Foundation
import Alamofire

protocol ApıServiceProtocol {
    func fetchLinks(completion: @escaping (Result<[Link], Error>) -> Void)
}

enum ApiServiceError: Error {
    case networkError(internal: Error)
    case serializationError(internal: Error)
}

class ApiService: ApıServiceProtocol {
    
    private let apiKey = "8cf5564564384ee7adf398e553335ccb"
    private let baseUrl = "https://api.rebrandly.com/v1/links"
    
    func fetchLinks(completion: @escaping (Result<[Link], any Error>) -> Void) {
        let url = "\(baseUrl)?apikey=\(apiKey)&action=listLinks"
        
        AF.request(url).responseData { <#AFDataResponse<Data>#> in
            <#code#>
        }
    }
    
    
}
