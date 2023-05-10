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

    /// check if AsyncMap works fine
    func testAsyncMap() {
        let expectation = XCTestExpectation(description: "asyncMap")
        var cancellables = Set<AnyCancellable>()
        let publisher = PassthroughSubject<Int, Never>()
        let map = publisher.asyncMap { value -> Int in
            return await self.asyncAddition(with: value)
        }

        map.sink { value in
            XCTAssertEqual(value, 3)
            expectation.fulfill()
        }.store(in: &cancellables)

        publisher.send(1)
        wait(for: [expectation], timeout: 3.0)
    }
}
