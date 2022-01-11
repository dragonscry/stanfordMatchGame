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
            GeometryReader { geometry in
                VStack {
                    ForEach(0..<cardCount){ index in
                        SymbolView(color: cardColor, shape: card.cardSymbol, cardFill: cardFill).frame(width: geometry.size.width/1.15, height: geometry.size.height/4)
                            
 //                           .position(x: geometry.size.width/2, y: geometry.size.height/2)
                    }
                }
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
            }
        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3))
    }
}

struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        SetCardView(card: SetCard(id: 1, cardColor: .red, cardSymbol: .diamond, cardCount: .three, cardFill: .filled))
    }
}
