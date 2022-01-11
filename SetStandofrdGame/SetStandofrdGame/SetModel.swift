//
//  SetModel.swift
//  SetStandofrdGame
//
//  Created by Denys on 08.01.2022.
//

import Foundation

struct SetGame {
    
    private let Deck : SetGameDeck
    
    private var fullDeck : Array<SetCard>
    private(set) var currentDeck : Array<SetCard>
    
    
    mutating func choose(_ card: SetCard) {
        if let chosenIndex = currentDeck.firstIndex(where: {$0.id == card.id}) {
            currentDeck[chosenIndex].isChosen.toggle()
        }
    }
    
    mutating func addThreeCards() {
        if !fullDeck.isEmpty {
            for _ in 0..<3 {
                currentDeck.append(fullDeck.removeFirst())
            }
        }
    }
    
    init() {
        Deck = SetGameDeck()
        fullDeck = Deck.deck
        currentDeck = []
        for _ in 0..<12 {
            currentDeck.append(fullDeck.removeFirst())
        }
    }
    
}

struct SetGameDeck {
    private(set) var deck : Array<SetCard>
    
    init() {
        deck = []
        var i = 0
        for color in cardColor.allCases {
            for symbol in cardSymbol.allCases {
                for counts in cardCount.allCases {
                    for filling in cardFill.allCases{
                        deck.append(SetCard(id: i, cardColor: color, cardSymbol: symbol, cardCount: counts, cardFill: filling))
                        i += 1
                    }
                }
            }
        }
        deck.shuffle()
    }
}


struct SetCard : Identifiable{
    var id: Int
    var isChosen = false
    var isMatched = false
    let cardColor : cardColor
    let cardSymbol : cardSymbol
    let cardCount: cardCount
    let cardFill: cardFill
}

enum cardColor : CaseIterable {
    case green, red, blue
}

enum cardSymbol : CaseIterable {
    case rect, oval, diamond
}

enum cardCount : CaseIterable {
    case one, two, three
}

enum cardFill : CaseIterable {
    case stroke, midfilled, filled
}
