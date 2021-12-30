//
//  EmojiMemoryGame.swift
//  StandfordMatchGame
//
//  Created by Denys on 31.12.2021.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    
    return "🚖"
}

class EmojiMemoryGame {
    
    static let emojies = ["🚘","🚔","🚅","✈️","🦼", "🛴", "🛵", "🚲", "🛺", "🚍", "🚡", "🚠", "🚃", "🚝", "🛩", "🛰"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojies[pairIndex]}
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
