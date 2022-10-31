//
//  IUserRepository.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

protocol IUserRepository {
    func makeServiceCallToFetchDetails(completion: @escaping DataResponse)
}
