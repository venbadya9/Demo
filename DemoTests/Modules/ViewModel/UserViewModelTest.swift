//
//  UserViewModelTest.swift
//  DemoTests
//
//  Created by Venkatesh Badya on 28/10/22.
//

import XCTest
@testable import Demo

class UserViewModelTest: XCTestCase {

    var viewModel: UserViewModel!
    var cellViewModel: UserCellViewModel!
    var useCase = MockUseCase()
    var expecatation: XCTestExpectation!
    
    override func setUpWithError() throws {
        viewModel = UserViewModel(useCase: useCase)
        viewModel.output = self
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testSuccessScenario() {
        expecatation = expectation(description: "Success")
        useCase.userList = UserDataListMockData.userDataList
        
        useCase.fetchUserList { result in
            switch result {
            case let .success(userList):
                let users = userList.data
                if users.count > 0 {
                    self.viewModel.output?.handleSuccess()
                }
            case let .failure(error):
                XCTFail("Failure not expected \(error.localizedDescription)")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testFailureScenario() {
        expecatation = expectation(description: "Failure")
        useCase.error = NSError(domain: "Failed", code: 0)
        
        useCase.fetchUserList { result in
            switch result {
            case .success(_):
                XCTFail("Success not expected")
            case .failure(_):
                self.viewModel.output?.handleFailure("Failed")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCellViewModel() {
        expecatation = expectation(description: "Loaded CellViewModel")
        var users: [UserCellViewModel] = [UserCellViewModel]()
        users =  self.viewModel.processFetchedUsers([UserDataListMockData.userData])
        if users.count > 0 {
            expecatation.fulfill()
        }
        wait(for: [expecatation], timeout: 1.0)
    }
}


extension UserViewModelTest: CallbackStatus {
    func handleSuccess() {
        expecatation.fulfill()
    }
    
    func handleFailure(_ message: String) {
        expecatation.fulfill()
    }
}
