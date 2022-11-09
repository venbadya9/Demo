//
//  MockRepository.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class MockRepository: UserRepositoryModel {
    
    var userList: UserModel?
    var error: Error?
    
    func makeServiceCallToFetchDetails(completion: @escaping DataResponse) {
        
        if let userList = userList {
            completion(.success(userList))
        } else if let _ = error {
            completion(.failure(NetworkError.failed))
        }
    }
}
