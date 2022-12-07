//
//  StraighteningTests.swift
//  StraighteningTests
//
//  Created by Josicleison Elves on 16/09/1401 AP.
//

import XCTest

@testable import Straightening

final class ExtensionsTests: XCTestCase {
    func testformatMask() {
        XCTAssertTrue(
            "123456791011".formatMask("(##)#####-####").contains("(") &&
            "123456791011".formatMask("(##)#####-####").contains(")") &&
            "123456791011".formatMask("(##)#####-####").contains("-")
        )
    }
}
