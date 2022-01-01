//
//  StandfordMatchGameApp.swift
//  StandfordMatchGame
//
//  Created by Denys on 29.12.2021.
//

import SwiftUI

@main
struct StandfordMatchGameApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
