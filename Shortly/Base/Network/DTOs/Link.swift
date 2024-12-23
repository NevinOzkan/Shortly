//
//  Link.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import Foundation

struct Link: Decodable {
    let id: String
    let title: String
    let slashtag: String
    let destination: String
    let shortUrl: String
    let createdAt: String
    let updatedAt: String
    let expiredAt: String?
    let status: String
    let clicks: Int
    let isPublic: Bool
    let domainName: String
    let domainId: String
    let domain: Domain
    let https: Bool
    let favourite: Bool
    let creator: Creator
}

struct Domain: Decodable {
    let id: String
    let fullName: String
    let active: Bool
}

struct Creator: Decodable {
    let id: String
    let fullName: String
    let avatarUrl: String
}
