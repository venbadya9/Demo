//
//  UserDomainDTO.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

// MARK: UserDomainListDTO

struct UserDomainListDTO: Equatable {
    let page, perPage, total, totalPages: Int
    let data: [UserDomainDTO]
}

extension UserDomainListDTO {
    struct UserDomainDTO: Equatable {
        let id: Int
        let email, firstName, lastName: String
        let avatar: String
    }
}

extension UserDomainListDTO {
    func toPresentation() -> UserList {
        return .init(data: data.map( { $0.toPresentation() }))
    }
}

extension UserDomainListDTO.UserDomainDTO {
    func toPresentation() -> UserList.User {
        return .init(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            avatar: avatar
        )
    }
}
