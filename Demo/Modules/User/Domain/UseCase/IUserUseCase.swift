//
//  IUserUseCase.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

protocol IUserUseCase {
    func fetchUserList(completion: @escaping DomainResponse)
}
