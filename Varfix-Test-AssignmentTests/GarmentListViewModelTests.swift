//
//  GarmentListViewModelTests.swift
//  Varfix-Test-AssignmentTests
//
//  Created by Muhammad Khan on 11/7/21.
//

import XCTest
@testable import Varfix_Test_Assignment

class GarmentListViewModelTests: XCTestCase {
    
    var viewModel: GarmentListViewModel!

    override func setUpWithError() throws {
        viewModel = GarmentListViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_check_garments_should_be_empty() {
        XCTAssertTrue(viewModel.getGarments().isEmpty)
    }
    
    func test_check_garments_count() {
        var garments = viewModel.getGarments()
        garments.append(Garment(createdAt: Date(), garmentName: "Shirt"))
        XCTAssertEqual(1, garments.count)
    }
    
    func test_check_garments_should_not_be_empty() {
        var garments = viewModel.getGarments()
        garments.append(Garment(createdAt: Date(), garmentName: "Shirt"))
        XCTAssertFalse(garments.isEmpty)
    }
    
    func test_check_delegate_should_be_nil() {
        XCTAssertNil(viewModel.delegate)
    }
}
