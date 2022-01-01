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

class EmojiMemoryGame: ObservableObject {
    
    static let emojies = ["🚘","🚔","🚅","✈️","🦼", "🛴", "🛵", "🚲", "🛺", "🚍", "🚡", "🚠", "🚃", "🚝", "🛩", "🛰"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojies[pairIndex]}
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
