//
//  Link.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import Foundation

struct Link: Decodable {
    var id: String
    var title: String
    var destination: String
    var shortUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case destination = "destination"
        case shortUrl = "shortUrl"
    }

    init(id: String = UUID().uuidString, title: String, destination: String, shortUrl: String) {
        self.id = id
        self.title = title
        self.destination = destination
        self.shortUrl = shortUrl
    }
}
