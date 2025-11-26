//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by nel on 2025-11-24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject private var viewModel = ExpenseViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
