//
//  MockUseCase.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class MockUseCase: UserUseCaseModel {
    
    var userList: UserModel?
    var error: Error?
    
    func fetchUserList(completion: @escaping DataResponse) {
        
        if let userList = userList {
            completion(.success(userList))
        } else if let _ = error {
            completion(.failure(NetworkError.failed))
        }
    }
}
