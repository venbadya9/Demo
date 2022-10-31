//
//  MockUseCase.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class MockUseCase: IUserUseCase {
    
    var userList: UserList?
    var error: Error?
    
    func fetchUserList(completion: @escaping DomainResponse) {
        
        if let userList = userList {
            completion(.success(userList))
        } else if let _ = error {
            completion(.failure(NetworkError.failed))
        }
    }
}
