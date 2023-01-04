//
//  AsyncCombineTests.swift
//  AsyncCombineTests
//
//  Created by Satoshi Komatsu on 2022/12/14.
//

import XCTest
import Combine
@testable import AsyncCombine

final class AwaitMapTests: XCTestCase {

    private func asyncAddition(with value: Int) async -> Int {
        try? await Task.sleep(nanoseconds: 2__000_000_000)
        return value + 2
    }

    func testExample() throws {
        var counter = 0
        let publisher = PassthroughSubject<Int, Never>()
        let map = publisher.tryMap { value -> Int in
            counter += 1
//            return await asyncAddition(with: value)
            let newValue = value + 1
            return newValue
        }

        publisher.send(1)
        publisher.send(2)
        publisher.send(3)

        XCTAssertEqual(counter, 2)
    }

}
