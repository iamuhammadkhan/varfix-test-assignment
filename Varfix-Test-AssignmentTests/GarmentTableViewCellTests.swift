//
//  GarmentTableViewCellTests.swift
//  Varfix-Test-AssignmentTests
//
//  Created by Muhammad Khan on 11/7/21.
//

import XCTest
@testable import Varfix_Test_Assignment

class GarmentTableViewCellTests: XCTestCase {

    var cell: GarmentTableViewCell!
    
    override func setUpWithError() throws {
        cell = GarmentTableViewCell()
        cell.awakeFromNib()
    }

    override func tearDownWithError() throws {
        cell = nil
    }

    func test_check_label_should_be_nil() {
        XCTAssertNil(cell.garmentNameLabel)
    }
}
