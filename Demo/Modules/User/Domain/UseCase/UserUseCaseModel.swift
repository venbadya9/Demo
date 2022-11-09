//
//  IUserUseCase.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

protocol UserUseCaseModel {
    func fetchUserList(completion: @escaping DataResponse)
}
