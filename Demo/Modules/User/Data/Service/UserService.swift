//
//  UserService.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class UserService: UserServiceModel {
    
    // MARK: Private Variables
    
    private let networkManager: NetworkManagerModel
    
    init(networkManager: NetworkManagerModel) {
        self.networkManager = networkManager
    }
    
    func makeNetworkApiCall(completion: @escaping DataResponse) { 
        self.networkManager.request(fromUrl: UserAPIEndpoints.userEndpoint, completion: completion)
    }
}
