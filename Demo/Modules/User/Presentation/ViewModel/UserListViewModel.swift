//
//  UserViewModelImpl.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

class UserListViewModel: UserViewDataModel {
    
    // MARK: Variables
    
    var output: CallbackStatus?
    var users: [UserCellViewModel]? = [UserCellViewModel]()
    var userModel: UserModel?
    
    // MARK: Private Variables
    
    private let useCase: UserUseCaseModel
    
    // MARK: Object Lifecycle
    
    init(useCase: UserUseCaseModel) {
        self.useCase = useCase
    }
    
    // MARK: Protocol Functions
    
    func fetchDetails() {
        
        self.useCase.fetchUserList { [weak self] result in
            switch result {
            case let .success(userList):
                self?.userModel = userList
                let users = userList.data
                self?.users = self?.processFetchedUsers(users) ?? []
                self?.output?.handleSuccess(nil)
            case let .failure(error):
                self?.output?.handleFailure(error.localizedDescription)
            }
        }
    }
    
    // MARK: Methods
    
    func processFetchedUsers(_ users: [UserModel.User]) -> [UserCellViewModel] {
        var userCellViewModel = [UserCellViewModel]()
        for user in users {
            userCellViewModel.append(generateCellViewModel(user))
        }
        return userCellViewModel
    }
    
    func generateCellViewModel(_ user: UserModel.User) -> UserCellViewModel {
        return UserCellViewModel(
            user.email,
            user.firstName,
            user.lastName,
            user.avatar
        )
    }
}
