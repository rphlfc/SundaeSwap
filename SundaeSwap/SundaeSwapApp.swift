//
//  SundaeSwapApp.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 27/01/22.
//

import SwiftUI

@main
struct SundaeSwapApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
