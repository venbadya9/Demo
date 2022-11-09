//
//  MockData.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

struct UserDataListMockData {
    static let userData: UserModel.User = UserModel.User(id: 1, email: "test@test.com", firstName: "Test", lastName: "Test", avatar: "http://www.gravatar.com/avatar")
    static let supportData: UserModel.Support = UserModel.Support(url: "http://www.gravatar.com/avatar", text: "test")
    static let userDataList: UserModel = UserModel(page: 1, perPage: 1, total: 1, totalPages: 1, data: [UserDataListMockData.userData], support: supportData)
}
