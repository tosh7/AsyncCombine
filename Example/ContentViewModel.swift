//
//  ContentViewModel.swift
//  Example
//
//  Created by Satoshi Komatsu on 2023/05/10.
//

import Foundation
import Combine
import AsyncCombine

final class ContentViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case completed
    }

    private var cancellables: Set<AnyCancellable> = []
    @Published private var state: State = .idle
    @Published private(set) var text: String = "Hello, world!"

    init() {
        $state.receive(on: DispatchQueue.main).asyncMap {
            await self.translateState($0)
        }.sink {
            self .text = $0
        }.store(in: &cancellables)
        state = .idle
    }

    func fetch() {
        Task { @MainActor in
            state = .loading
            try! await Task.sleep(nanoseconds: 3_000_000_000)
            state = .completed
        }
    }

    private func translateState(_ state: State) async -> String {

        try! await Task.sleep(nanoseconds: 3_000_000_000)
        switch state {
        case .idle:
            return "Hello, world!"
        case .loading:
            return "Loading..."
        case .completed:
            return "fetch completed!"
        }
    }
}
