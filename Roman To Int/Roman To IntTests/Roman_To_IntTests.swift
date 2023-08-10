//
//  Roman_To_IntTests.swift
//  Roman To IntTests
//
//  Created by niravkumar patel on 8/8/23.
//

import XCTest
@testable import Roman_To_Int

final class Roman_To_IntTests: XCTestCase {

    let viewModel = ContentViewViewModel()
    
    func testViewModelSuccessfull() {
        
        let userInput: String = "X"
        let intergerNumber = viewModel.convertRomanToInteger(userInput)
        
        
        XCTAssertNotNil(intergerNumber)
        XCTAssertFalse(userInput == "10")
        XCTAssertEqual(intergerNumber, 10)
    }
}
