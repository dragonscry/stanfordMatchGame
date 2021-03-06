//
//  EmojiMemoryGame.swift
//  StandfordMatchGame
//
//  Created by Denys on 31.12.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let themes = [
        Theme<String>(themeName: "Jorney", emojies: ["π","π","π","βοΈ","π¦Ό", "π΄", "π΅", "π²", "πΊ", "π", "π‘", "π ", "π", "π", "π©", "π°"], numberOfPairs: 5, cardColor: "red"),
        Theme<String>(themeName: "Smiles", emojies: ["π","π","π","π","π₯Έ","π","π©","π","π","βΉοΈ","π","π₯Ί"], numberOfPairs: 8, cardColor: "indigo"),
        Theme<String>(themeName: "Animals", emojies: ["πΆ","π±","π­","πΉ","π¦","π°","π»","πΌ","π»ββοΈ","π¨","π―","π¦"], numberOfPairs: 40, cardColor: "red"),
        Theme<String>(themeName: "Food", emojies: ["π","π","π","π","π","π","π","π","π","π«","π","π"], numberOfPairs: 8, cardColor: "blue"),
        Theme<String>(themeName: "Activity", emojies: ["β½οΈ","π","π","βΎοΈ","π₯","πΎ","π","π","π₯","π±","π","π"], numberOfPairs: 8, cardColor: "gray"),
        Theme<String>(themeName: "Objects", emojies: ["βοΈ","π±","π»","π₯","π¨","πΉ","π½","πΎ","πΌ","βοΈ","π§­","β°"], numberOfPairs: 8, cardColor: "green")]
    
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
    
    func shuffle() {
        model.shuffle()
    }
    
    
    
    
    
    
}


