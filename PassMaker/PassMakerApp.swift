//
//  PassMakerApp.swift
//  PassMaker
//
//  Created by Paul van Woensel on 2/18/23.
//

import SwiftUI

@main
struct PassMakerApp: App {
    var body: some Scene {
        MenuBarExtra("Testing this!", systemImage: "lock.shield") {
            ContentView().background(Color("MainBG"))
        }.menuBarExtraStyle(.window)
    }
}
