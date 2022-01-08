//
//  SetModelView.swift
//  SetStandofrdGame
//
//  Created by Denys on 09.01.2022.
//

import SwiftUI

class SetModelView: ObservableObject {
    @Published private var model: SetGame
    
    var cards: Array<SetCard> {
        model.currentDeck
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
