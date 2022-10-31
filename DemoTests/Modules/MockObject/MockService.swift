//
//  MockService.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class MockService: IUserService {
    
    var userList: UserDataListDTO?
    var error: Error?
    
    func makeNetworkApiCall(completion: @escaping DataResponse) {
        
        if let userList = userList {
            completion(.success(userList.toDomain()))
        } else if let _ = error {
            completion(.failure(NetworkError.failed))
        }
    }
}
