//
//  UserRepositoryTest.swift
//  DemoTests
//
//  Created by Venkatesh Badya on 28/10/22.
//

import XCTest
@testable import Demo

class UserRepositoryTest: XCTestCase {

    var repository: UserRepository!
    let service = MockService()
    
    override func setUpWithError() throws {
        repository = UserRepository(service: service)
    }
    
    override func tearDown() {
        super.tearDown()
        repository = nil
    }
    
    func testSuccessScenario() {
        let expecatation = expectation(description: "Success")
        service.userList = UserDataListMockData.userDataList
        
        service.makeNetworkApiCall { result in
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
        service.error = NSError(domain: "Failed", code: 0)
        
        service.makeNetworkApiCall { result in
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
