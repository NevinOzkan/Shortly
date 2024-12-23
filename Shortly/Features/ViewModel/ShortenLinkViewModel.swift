//
//  ShortenLinkViewModel.swift
//  Shortly
//
//  Created by Nevin Özkan on 23.12.2024.
//

import Foundation

class LinkListViewModel {
    
    private let apiService: ApiService
    var onLinksUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
      var links: [Link] = []
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func shortenLink(originalUrl: String, title: String, completion: @escaping (Bool) -> Void) {
        apiService.shortenLink(originalUrl: originalUrl, title: title) { [weak self] result in
            switch result {
            case .success(let links):
                if let firstLink = links.first {
                    print("Kısa Link: \(firstLink.shortUrl)")
                }
                self?.onLinksUpdated?()
                completion(true)
            case .failure(let error):
                self?.onError?("Link kısaltılamadı. Hata: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
