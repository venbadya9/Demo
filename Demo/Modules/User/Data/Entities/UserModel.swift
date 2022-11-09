//
//  User.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

// MARK: UserModel

struct UserModel: Decodable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support

    private enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

extension UserModel {
    struct User: Decodable {
        let id: Int
        let email, firstName, lastName: String
        let avatar: String

        private enum CodingKeys: String, CodingKey {
            case id, email
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar
        }
    }
}

extension UserModel {
    struct Support: Decodable {
        let url: String
        let text: String
    }
}

