//
//  Publishers.AwaitMap.swift
//  
//
//  Created by Satoshi Komatsu on 2022/12/14.
//

import Foundation
import Combine

extension Publisher {
    public func asyncMap<T>(
        _ transform: @escaping (Output) async -> T
    ) -> Publishers.FlatMap<Future<T, Never>, Self> {
        flatMap { value in
            Future { promise in
                // Call this task in main actor to avoid sequence reordering
                Task { @MainActor in
                    let output = await transform(value)
                    promise(.success(output))
                }
            }
        }
    }
}
