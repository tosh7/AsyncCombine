//
//  Publishers.AwaitMap.swift
//  
//
//  Created by Satoshi Komatsu on 2022/12/14.
//

import Foundation
import Combine

extension Publisher {
    public func awaitMap<Result>(
        _ transform: @escaping (Output) -> Result
    ) ->  Publishers.Map<Self, Result> {
        return Publishers.AwaitMap(upstream: self, transform: transform)
    }
}

extension Publisher {
    public struct AwaitMap<Upstream: Publisher, Output>: Publisher {


    }
}
