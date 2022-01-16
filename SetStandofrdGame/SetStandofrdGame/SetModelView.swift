//
//  SetModelView.swift
//  SetStandofrdGame
//
//  Created by Denys on 09.01.2022.
//

import SwiftUI

class SetModelView: ObservableObject {
    @Published private var model: SetGame
    
    func score() -> Int {
        return model.score
    }
    
    func cardCountInFullDeck() -> Int {
        return model.fullDeck.count
    }
    var cards: Array<SetCard> {
        model.fullDeck
    }
    
    func addThreeCards() {
        model.addThreeCards()
    }
    
    func choose(_ card: SetCard) {
        model.choose(card)
    }
    
    func restart() {
        self.model = SetGame()
    }
    
    init() {
        self.model = SetGame()
    }
}
