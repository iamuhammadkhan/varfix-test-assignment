//
//  GarmentListViewControllerTests.swift
//  Varfix-Test-AssignmentTests
//
//  Created by Muhammad Khan on 11/7/21.
//

import XCTest
@testable import Varfix_Test_Assignment

class GarmentListViewControllerTests: XCTestCase {

    var vc: GarmentsListViewController!
    
    override func setUpWithError() throws {
        vc = GarmentsListViewController()
        vc.loadView()
        vc.viewDidLoad()
    }

    override func tearDownWithError() throws {
        vc = nil
    }

    func test_check_table_view_should_be_nil() {
        XCTAssertNil(vc.tableView)
    }
    
    func test_check_table_view_should_not_be_nil() {
        vc.tableView = UITableView()
        XCTAssertNil(vc.tableView)
    }
}
