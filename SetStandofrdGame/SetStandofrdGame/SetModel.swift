//
//  SetModel.swift
//  SetStandofrdGame
//
//  Created by Denys on 08.01.2022.
//

import Foundation

struct SetGame {
    
    private let Deck : SetGameDeck
    
    private(set) var fullDeck : Array<SetCard>
    private(set) var currentDeck : Array<SetCard>
    private(set) var sbros: Array<SetCard>
    private var firstChosenCardIndex : Int?
    private var secondChosenCardIndex : Int?
    private var thirdChosenCardIndex : Int?
    
    var score = 0
    
    
    mutating func choose(_ card: SetCard) {
        if let chosenIndex = currentDeck.firstIndex(where: {$0.id == card.id}) {
            
            currentDeck[chosenIndex].isChosen.toggle()
            
            if currentDeck[chosenIndex].isChosen {
                if firstChosenCardIndex == nil {
                    firstChosenCardIndex = chosenIndex
                }
                else if secondChosenCardIndex == nil {
                    secondChosenCardIndex = chosenIndex
                }
                else if thirdChosenCardIndex == nil {
                    thirdChosenCardIndex = chosenIndex
                }
            }
            
            if !currentDeck[chosenIndex].isChosen {
                if firstChosenCardIndex == chosenIndex {
                    firstChosenCardIndex = nil
                }
                else if secondChosenCardIndex == chosenIndex {
                    secondChosenCardIndex = nil
                }
                else if thirdChosenCardIndex == chosenIndex {
                    thirdChosenCardIndex = nil
                }
            }
            
            if firstChosenCardIndex != nil && secondChosenCardIndex != nil && thirdChosenCardIndex != nil {
                if cardColorMatch(firstCard: currentDeck[firstChosenCardIndex!], secondCard: currentDeck[secondChosenCardIndex!], thirdCard: currentDeck[thirdChosenCardIndex!]) &&
                    cardSymbolMatch(firstCard: currentDeck[firstChosenCardIndex!], secondCard: currentDeck[secondChosenCardIndex!], thirdCard: currentDeck[thirdChosenCardIndex!]) &&
                    cardCountMatch(firstCard: currentDeck[firstChosenCardIndex!], secondCard: currentDeck[secondChosenCardIndex!], thirdCard: currentDeck[thirdChosenCardIndex!]) &&
                    cardFillMatch(firstCard: currentDeck[firstChosenCardIndex!], secondCard: currentDeck[secondChosenCardIndex!], thirdCard: currentDeck[thirdChosenCardIndex!])
                {
                    score += 3
                    if !fullDeck.isEmpty {
                        sbros.append(currentDeck.remove(at: firstChosenCardIndex!))
                        var card = fullDeck.removeFirst()
                        card.isFaceUp = true
                        currentDeck.insert(card, at: firstChosenCardIndex!)
                        sbros.append(currentDeck.remove(at: secondChosenCardIndex!))
                        card = fullDeck.removeFirst()
                        card.isFaceUp = true
                        currentDeck.insert(card, at: secondChosenCardIndex!)
                        sbros.append(currentDeck.remove(at: thirdChosenCardIndex!))
                        card = fullDeck.removeFirst()
                        card.isFaceUp = true
                        currentDeck.insert(card, at: thirdChosenCardIndex!)
                    } else
                    {
                        currentDeck.remove(at: firstChosenCardIndex!)
                        currentDeck.remove(at: secondChosenCardIndex!)
                        currentDeck.remove(at: thirdChosenCardIndex!)
                    }
                    
                }
                else {
                    score -= 1
                    currentDeck[firstChosenCardIndex!].isChosen = false
                    currentDeck[secondChosenCardIndex!].isChosen = false
                    currentDeck[thirdChosenCardIndex!].isChosen = false
                }
                
                firstChosenCardIndex = nil
                secondChosenCardIndex = nil
                thirdChosenCardIndex = nil
                
            }
            
        }
    }
    
    mutating func addThreeCards() {
        if !fullDeck.isEmpty && !currentDeck.isEmpty {
            for _ in 0..<3 {
                var card = fullDeck.removeFirst()
                card.isFaceUp = true
                self.currentDeck.append(card)
            }
        }
    }
    
    mutating func gameDeck() {
        var card = fullDeck.removeFirst()
        card.isFaceUp = true
        self.currentDeck.append(card)
    }
    
    init() {
        Deck = SetGameDeck()
        fullDeck = Deck.deck
        currentDeck = []
        sbros = []
    }
    
    func cardColorMatch(firstCard: SetCard, secondCard: SetCard, thirdCard: SetCard) -> Bool {
        if ((firstCard.cardColor == secondCard.cardColor) && (secondCard.cardColor == thirdCard.cardColor)) || ((firstCard.cardColor != secondCard.cardColor) && (secondCard.cardColor != thirdCard.cardColor)){
            return true
        }
        else {
            return false
        }
    }
    func cardSymbolMatch(firstCard: SetCard, secondCard: SetCard, thirdCard: SetCard) -> Bool {
        if ((firstCard.cardSymbol == secondCard.cardSymbol) && (secondCard.cardSymbol == thirdCard.cardSymbol)) || ((firstCard.cardSymbol != secondCard.cardSymbol) && (secondCard.cardSymbol != thirdCard.cardSymbol)){
            return true
        }
        else {
            return false
        }
    }
    func cardCountMatch(firstCard: SetCard, secondCard: SetCard, thirdCard: SetCard) -> Bool {
        if ((firstCard.cardCount == secondCard.cardCount) && (secondCard.cardCount == thirdCard.cardCount)) || ((firstCard.cardCount != secondCard.cardCount) && (secondCard.cardCount != thirdCard.cardCount)){
            return true
        }
        else {
            return false
        }
    }
    func cardFillMatch(firstCard: SetCard, secondCard: SetCard, thirdCard: SetCard) -> Bool {
        if ((firstCard.cardFill == secondCard.cardFill) && (secondCard.cardFill == thirdCard.cardFill)) || ((firstCard.cardFill != secondCard.cardFill) && (secondCard.cardFill != thirdCard.cardFill)){
            return true
        }
        else {
            return false
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
    var isFaceUp = false
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
