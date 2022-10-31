//
//  DataList.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

// MARK: UserList

struct UserList: Equatable {
    let data: [User]
}

extension UserList {
    struct User: Equatable {
        let id: Int
        let email, firstName, lastName: String
        let avatar: String
    }
}
