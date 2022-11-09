//
//  UserRepository.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class UserRepository: UserRepositoryModel {
    
    // MARK: Private Variables
    
    private let service: UserServiceModel
    
    init(service: UserServiceModel) {
        self.service = service
    }
    
    func makeServiceCallToFetchDetails(completion: @escaping DataResponse) {
        self.service.makeNetworkApiCall(completion: completion)
    }
}
