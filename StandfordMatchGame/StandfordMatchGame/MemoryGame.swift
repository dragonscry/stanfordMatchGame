//
//  MemoryGame.swift
//  StandfordMatchGame
//
//  Created by Denys on 31.12.2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    var score = 0
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                else {
                    if cards[chosenIndex].wasChosen && cards[potentialMatchIndex].wasChosen {
                        self.score -= 2
                    }
                    else if cards[chosenIndex].wasChosen || cards[potentialMatchIndex].wasChosen {
                        self.score -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].wasChosen = true
                cards[potentialMatchIndex].wasChosen = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent ){
        cards = []
        // add numb x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards = cards.shuffled()
        
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id : Int
        var wasChosen: Bool = false
    }
}

struct Theme<Content> {
    let themeName : String
    var emojies: [Content]
    private var numberOfPairs: Int
    var cardPairs: Int {
        get {
            if numberOfPairs > emojies.count {
                return emojies.count
            } else if numberOfPairs < 1 {
                return 1
            } else {
                return self.numberOfPairs
            }
        }
        set {
            if newValue < 1 {
                self.numberOfPairs = 1
            } else if newValue > emojies.count {
                self.numberOfPairs = emojies.count
            } else {
                self.numberOfPairs = newValue
            }
        }
    }
    let cardColor: String
    
    init(themeName: String, emojies: [Content], numberOfPairs: Int, cardColor: String){
        self.themeName = themeName
        self.emojies = emojies
        self.numberOfPairs = numberOfPairs
        self.cardColor = cardColor
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
