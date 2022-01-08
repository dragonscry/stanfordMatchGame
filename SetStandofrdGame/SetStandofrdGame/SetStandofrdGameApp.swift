//
//  SetStandofrdGameApp.swift
//  SetStandofrdGame
//
//  Created by Denys on 08.01.2022.
//

import SwiftUI

@main
struct SetStandofrdGameApp: App {
    let game = SetModelView()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
