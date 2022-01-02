//
//  EmojiMemoryGame.swift
//  StandfordMatchGame
//
//  Created by Denys on 31.12.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let themes = [
        Theme(themeName: "Jorney", emojies: ["🚘","🚔","🚅","✈️","🦼", "🛴", "🛵", "🚲", "🛺", "🚍", "🚡", "🚠", "🚃", "🚝", "🛩", "🛰"], numberOfPairs: 5, cardColor: "red"),
        Theme(themeName: "Smiles", emojies: ["😀","😄","🙃","😉","🥸","😜","😩","😍","😋","☹️","😔","🥺"], numberOfPairs: 8, cardColor: "indigo"),
        Theme(themeName: "Animals", emojies: ["🐶","🐱","🐭","🐹","🦊","🐰","🐻","🐼","🐻‍❄️","🐨","🐯","🦁"], numberOfPairs: 40, cardColor: "red"),
        Theme(themeName: "Food", emojies: ["🍏","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍈","🫐","🍒","🍑"], numberOfPairs: 8, cardColor: "blue"),
        Theme(themeName: "Activity", emojies: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🏓","🏒"], numberOfPairs: 8, cardColor: "gray"),
        Theme(themeName: "Objects", emojies: ["⌚️","📱","💻","🖥","🖨","🕹","💽","💾","📼","☎️","🧭","⏰"], numberOfPairs: 8, cardColor: "green")]
    
    var number : Int
    
    static func createMemoryGame(themeNumber: Int) -> MemoryGame<String> {
        var theme = EmojiMemoryGame.themes[themeNumber]
        theme.emojies = theme.emojies.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.cardPairs) { pairIndex in theme.emojies[pairIndex]}
    }
    
    @Published private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func reinvoke() {
        self.number = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        self.model = EmojiMemoryGame.createMemoryGame(themeNumber: number)
    }
    
    func score() -> Int {
        return model.score
    }
    
    init() {
        self.number = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        self.model = EmojiMemoryGame.createMemoryGame(themeNumber: number)
    }
    
}


