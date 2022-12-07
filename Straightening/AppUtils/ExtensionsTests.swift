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
        let phoneTest = {(numbers: [String: String]) in
            for number in numbers {
                XCTAssertTrue(number.key.formatMask(number.value).first == "(" &&
                              number.key.formatMask(number.value).contains(")") &&
                              number.key.formatMask(number.value).contains("-"))
            }
        }
        phoneTest(["123456791011": "(##)#####-####",
                   "123456791": "(##)#####-####",
                   "12345679101a1": "(##)#####-####",
                   "(12)34567-91011": "(##)#####-####",
                   "(1)23-456791011": "(##)#####-####",
                   "1###23456791011": "(##)#####-####",
                   "123456791011123": "(##)#####-####"])
    }
}
