//
//  URLShortening.swift
//  Shortly
//
//  Created by Nevin Özkan on 19.12.2024.
//

import SwiftData

@Model
class ShortLink {
    var shortURL: String
    var longURL: String

    init(shortURL: String, longURL: String) {
        self.shortURL = shortURL
        self.longURL = longURL
    }
}

