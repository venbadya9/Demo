//
//  UserUseCase.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class UserUseCase: UserUseCaseModel {
    
    // MARK: Private Variables
    
    private let repository: UserRepositoryModel
    
    init(repository: UserRepositoryModel) {
        self.repository = repository
    }

    // MARK: Protocol Functions
    
    func fetchUserList(completion: @escaping DataResponse) {
        return self.repository.makeServiceCallToFetchDetails(completion: completion)
    }
}
