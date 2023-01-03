//
//  AsyncCombineTests.swift
//  AsyncCombineTests
//
//  Created by Satoshi Komatsu on 2022/12/14.
//

import XCTest
@testable import AsyncCombine

final class AwaitMapTests: XCTestCase {

    private func awaiting(for seconds: Double) async -> Double {
        return seconds + 2.0
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

}
