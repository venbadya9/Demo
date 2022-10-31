//
//  UserService.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class UserService: IUserService {
    
    // MARK: Private Variables
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func makeNetworkApiCall(completion: @escaping DataResponse) {
        self.networkManager.request(fromUrl: UserAPIEndpoints.userEndpoint) { (result: Result<UserDataListDTO, Error>) in
            switch result {
            case .success(let users):
                completion(.success(users.toDomain()))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }
}
