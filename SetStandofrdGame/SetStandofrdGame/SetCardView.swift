//
//  SetCardView.swift
//  SetStandofrdGame
//
//  Created by Denys on 09.01.2022.
//

import SwiftUI

struct SetCardView: View {
    let card: SetCard
    
    var cardColor: Color {
        switch card.cardColor {
        case .blue :
            return .blue
        case .red :
            return .red
        case .green :
            return .green
        }
    }
    
    var cardCount : Int {
        switch card.cardCount {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
    
    var cardFill : Color {
        switch card.cardFill {
        case .filled:
            return cardColor
        case .midfilled:
            return cardColor.opacity(0.5)
        case .stroke:
            return .white
        }
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                ForEach(0..<cardCount){ index in
                    if card.cardSymbol == .oval {
                        Capsule().strokeBorder(lineWidth: 3).foregroundColor(cardFill)
                    }
                    else if card.cardSymbol == .rect {
                        Rectangle().fill(cardFill)
                    }
                    else {
                        DiamondShape().fill(cardFill)
                    }
                }
            }
        }
    }
}

struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        SetCardView(card: SetCard(id: 3, cardColor: .red, cardSymbol: .diamond, cardCount: .three, cardFill: .filled))
    }
}
