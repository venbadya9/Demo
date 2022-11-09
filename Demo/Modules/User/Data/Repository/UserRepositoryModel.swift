//
//  IUserRepository.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

protocol UserRepositoryModel {
    func makeServiceCallToFetchDetails(completion: @escaping DataResponse)
}
