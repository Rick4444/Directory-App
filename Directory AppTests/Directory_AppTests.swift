//
//  Directory_AppTests.swift
//  Directory AppTests
//

import XCTest
@testable import Directory_App

final class Directory_AppTests: XCTestCase {
    
    var employeesViewModel: EmployeesViewModel?
    var viewController: ViewController?
    
    var roomsViewModel: RoomsViewModel?
    var roomsController: RoomsController?

    override func setUpWithError() throws {
        employeesViewModel = EmployeesViewModel()
        viewController = ViewController()
        
        roomsViewModel = RoomsViewModel()
        roomsController = RoomsController()
    }

    override func tearDownWithError() throws {
        employeesViewModel = nil
        viewController = nil
        
        roomsViewModel = nil
        roomsController = nil
    }
    
    func testEmployeesResponse() throws {
        let expectation = self.expectation(description: "employees Response Expectation")
        employeesViewModel?.bindEmployeeViewModelToController = {
            XCTAssertNotEqual(0, self.employeesViewModel?.empData.count)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    
    func testRoomsResponse() throws {
        let expectation = self.expectation(description: "rooms Response Expectation")
        roomsViewModel?.bindRoomsViewModelToController = {
           
            XCTAssertNotEqual(0, self.roomsViewModel?.roomData.count)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
