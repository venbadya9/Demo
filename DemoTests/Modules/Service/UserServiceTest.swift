//
//  UserServiceTest.swift
//  DemoTests
//
//  Created by Venkatesh Badya on 28/10/22.
//

import XCTest
@testable import Demo

class UserServiceTest: XCTestCase {

    var service: UserService!
    let networkManager = MockNetworkManager()
    
    override func setUpWithError() throws {
        service = UserService(networkManager: networkManager)
    }
    
    override func tearDown() {
        super.tearDown()
        service = nil
    }
    
    func testSuccessScenario() {
        let expecatation = expectation(description: "Success")
        networkManager.userList = UserDataListMockData.userDataList
        
        networkManager.request(fromUrl: UserAPIEndpoints.userEndpoint) { (result: Result<UserModel, Error>) in
            switch result {
            case let .success(userList):
                let users = userList.data
                if users.count > 0 {
                    expecatation.fulfill()
                }
            case let .failure(error):
                XCTFail("Failure not expected \(error.localizedDescription)")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testFailureScenario() {
        let expecatation = expectation(description: "Failure")
        networkManager.error = NSError(domain: "Failed", code: 0)
        
        networkManager.request(fromUrl: UserAPIEndpoints.userEndpoint) { (result: Result<UserModel, Error>) in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case .failure(_):
                expecatation.fulfill()
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
}

