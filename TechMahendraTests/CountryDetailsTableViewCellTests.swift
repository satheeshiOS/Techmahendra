//
//  CountryDetailsTableViewCellTests.swift
//  TechMahendraTests
//
//  Created by Satheesh Speed Mac on 13/10/20.
//

import XCTest
@testable import TechMahendra

class CountryDetailsTableViewCellTests: XCTestCase {

    var cell: CountryDetailsTableViewCell!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cell = CountryDetailsTableViewCell()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cell = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSetUpUILayout() throws {
        cell.setUpUILayout()
    }
    
    func testPrepareForUse() throws {
        cell.prepareForReuse()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
