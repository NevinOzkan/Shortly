//
//  LinkListViewModel.swift
//  Shortly
//
//  Created by Nevin Özkan on 17.12.2024.
//

import Foundation

class LinkListViewModel {
    
    var links: [Link] = []
    var onLinksUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    private let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    func shortenLink(originalUrl: String, title: String, completion: @escaping (Bool) -> Void) {
        apiService.shortenLink(originalUrl: originalUrl, title: title) { result in
            switch result {
            case .success(let link):
                self.links.append(link)
                self.onLinksUpdated?()
                completion(true)
            case .failure(let error):
                self.onError?("Hata: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
