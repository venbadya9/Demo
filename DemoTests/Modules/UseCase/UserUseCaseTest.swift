//
//  UserUseCaseTest.swift
//  DemoTests
//
//  Created by Venkatesh Badya on 28/10/22.
//

import XCTest
@testable import Demo

class UserUseCaseTest: XCTestCase {

    var useCase: UserUseCase!
    let repository = MockRepository()
    
    override func setUpWithError() throws {
        useCase = UserUseCase(repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        useCase = nil
    }
    
    func testSuccessScenario() {
        let expecatation = expectation(description: "Success")
        repository.userList = UserDataListMockData.userDataList
        
        useCase.fetchUserList { result in
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
        repository.error = NSError(domain: "Failed", code: 0)
        
        useCase.fetchUserList { result in
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
