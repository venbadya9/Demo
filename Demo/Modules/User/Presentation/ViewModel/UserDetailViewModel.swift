//
//  UserDetailViewModel.swift
//  Demo
//
//  Created by Venkatesh Badya on 09/11/22.
//

import Foundation

import Foundation

class UserDetailViewModel: UserViewDataModel {
    
    // MARK: Variables
    
    var output: CallbackStatus?
    var userModel: UserModel?
    let index: Int
    
    // MARK: Object Lifecycle
    
    init(_ userModel: UserModel, _ index: Int) {
        self.userModel = userModel
        self.index = index
    }
    
    // MARK: Protocol Functions
    
    func fetchDetails() {
        if let supportUrl = URL(string: self.userModel?.support.url ?? "") {
            self.output?.handleSuccess(supportUrl)
        } else {
            self.output?.handleFailure(NSLocalizedString("url_error", comment: ""))
        }
    }
}
