//
//  StraighteningTests.swift
//  StraighteningTests
//
//  Created by Josicleison Elves on 16/09/1401 AP.
//

import XCTest

@testable import Straightening

final class ExtensionsTests: XCTestCase {
    func testFormatMask() {
        let phoneTest = {(number: String, format: String) in
            XCTAssertTrue(number.formatMask(format).first == "(" &&
                          number.formatMask(format).contains(")") &&
                          number.formatMask(format).contains("-"))
        }
        phoneTest("123456791011", "(##)#####-####")
        phoneTest("123456791", "(##)#####-####")
        phoneTest("12345679101a1", "(##)#####-####")
        phoneTest("(12)34567-91011", "(##)#####-####")
        phoneTest("(1)23-456791011", "(##)#####-####")
        phoneTest("1(###23456791011", "(##)#####-####")
        phoneTest("123456791011123", "(##)#####-####")
    }
}
