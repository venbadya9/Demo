//
//  UserViewModel.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

// MARK: UserViewModel Protocol

protocol UserViewDataModel {
    var users: [UserCellViewModel]? { get set }
    var output: CallbackStatus? { get set }
    var userModel: UserModel? { get set }
    func fetchDetails()
}

extension UserViewDataModel {
    
    var users: [UserCellViewModel]? {
        get { return nil } set {}
    }
    
    var userModel: UserModel? {
        get { return nil } set {}
    }
}

// MARK: CallbackStatus Protocol

protocol CallbackStatus {
    func handleSuccess(_ url: URL?)
    func handleFailure(_ message: String)
    func handleNavigation(_ index: Int?)
}

extension CallbackStatus {
    
    func handleNavigation(_ index: Int?) {}
}
