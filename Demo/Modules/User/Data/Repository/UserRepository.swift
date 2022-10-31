//
//  UserRepository.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class UserRepository: IUserRepository {
    
    // MARK: Private Variables
    
    private let service: IUserService
    
    init(service: IUserService) {
        self.service = service
    }
    
    func makeServiceCallToFetchDetails(completion: @escaping DataResponse) {
        self.service.makeNetworkApiCall(completion: completion)
    }
}
