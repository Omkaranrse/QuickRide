//
//  UberApp.swift
//  Uber
//
//  Created by Omkar Anarse on 20/01/24.
//

import SwiftUI

@main
struct UberApp: App {
    
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
