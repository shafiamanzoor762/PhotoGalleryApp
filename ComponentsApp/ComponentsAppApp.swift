//
//  ComponentsAppApp.swift
//  ComponentsApp
//
//  Created by apple on 02/09/2024.
//

import SwiftUI

@main
struct ComponentsAppApp: App {
    @StateObject var navBarState = NavBarState()
    @StateObject var navManager = NavManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navBarState)
                .environmentObject(navManager)
        }
    }
}

