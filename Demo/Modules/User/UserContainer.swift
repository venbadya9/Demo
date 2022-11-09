//
//  UserContainer.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation
import UIKit

class UserModule {
    
    private let networkManager: NetworkManagerModel
    
    init(networkManager: NetworkManagerModel) {
        self.networkManager = networkManager
    }
    
    // List Screen
    
    func generateViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "UserListVC") as? UserListVC  else {
            fatalError()
        }
        viewController.viewModel = generateUserViewModel()
        viewController.viewModel?.output = viewController
        return viewController
    }
    
    private func generateUserViewModel() -> UserViewDataModel {
        let viewModel = UserListViewModel(useCase: generateUserUseCase())
        return viewModel
    }
    
    private func generateUserUseCase() -> UserUseCaseModel {
        let useCase = UserUseCase(repository: generateUserRepository())
        return useCase
    }
    
    private func generateUserRepository() -> UserRepositoryModel {
        let repository = UserRepository(service: createUserService())
        return repository
    }
    
    private func createUserService() -> UserServiceModel {
        let service = UserService(networkManager: networkManager)
        return service
    }
}

class UserDetailModule {
    
    // Detail Screen
    
    func generateDetailViewController(_ userModel: UserModel, _ userIndex: Int) -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "UserDetailVC") as? UserDetailVC  else {
            fatalError()
        }
        viewController.viewModel = generateUserViewModel(userModel, userIndex)
        viewController.viewModel?.output = viewController
        return viewController
    }
    
    private func generateUserViewModel(_ userModel: UserModel, _ userIndex: Int) -> UserDetailViewModel {
        let viewModel = UserDetailViewModel(userModel, userIndex)
        return viewModel
    }
}
