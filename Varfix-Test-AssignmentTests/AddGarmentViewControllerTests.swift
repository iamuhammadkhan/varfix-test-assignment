//
//  AddGarmentViewControllerTests.swift
//  Varfix-Test-AssignmentTests
//
//  Created by Muhammad Khan on 11/7/21.
//

import XCTest
@testable import Varfix_Test_Assignment

class AddGarmentViewControllerTests: XCTestCase {

    var vc: AddGarmentViewController!
    
    override func setUpWithError() throws {
        vc = AddGarmentViewController()
        vc.loadView()
        vc.viewDidLoad()
    }

    override func tearDownWithError() throws {
        vc = nil
    }
    
    func test_title_label_should_be_nil() {
        XCTAssertNil(vc.titleLabel)
    }
    
    func test_input_text_field_should_be_nil() {
        XCTAssertNil(vc.inputTextField)
    }
    
    func test_title_label_should_not_be_nil() {
        vc.titleLabel = UILabel()
        XCTAssertNil(vc.titleLabel)
    }
    
    func test_input_text_field_should_not_be_nil() {
        vc.inputTextField = UITextField()
        XCTAssertNil(vc.inputTextField)
    }
    
    func test_check_delegate_should_be_nil() {
        XCTAssertNil(vc.delegate)
    }
}
