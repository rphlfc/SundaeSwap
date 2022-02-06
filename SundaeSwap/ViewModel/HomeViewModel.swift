//
//  HomeViewModel.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 30/01/22.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var pools: [Pool] = []
    @Published var searchText: String = ""
    
    @Published var token1: Token?
    @Published var token2: Token?
    
    @Published var selectedTabIndex: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
        
    init() {
        self.pools = samplePools
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(search)
            .sink { [weak self] result in
                self?.pools = result
            }
            .store(in: &cancellables)
    }
    
    private func search(text: String) -> [Pool] {
        guard !text.isEmpty else {
            return samplePools
        }
        
        let lowercased = text.lowercased()
        
        return samplePools.filter { pool -> Bool in
            return pool.token1.name.lowercased().contains(lowercased) || pool.token2.name.lowercased().contains(lowercased)
        }
    }
    
    func expandPoolAtIndex(_ index: Int) {
        pools[index].isExpanded.toggle()
    }
    
    func swapToken(_ token: Token) {
        swapTokens(token1: nil, token2: token)
    }
    
    func swapTokens(token1: Token?, token2: Token) {
        withAnimation {
            self.selectedTabIndex = 1
        }
        
        self.token1 = token1
        self.token2 = token2
    }
    
    func clearTokens() {
        self.token1 = nil
        self.token2 = nil
    }
    
    func invertTokens() {
        var aux = token1
        token1 = token2
        token2 = aux
        aux = nil
    }
}
