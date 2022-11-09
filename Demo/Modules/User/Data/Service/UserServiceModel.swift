//
//  IUserService.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation

protocol UserServiceModel {
    func makeNetworkApiCall(completion: @escaping DataResponse)
}
