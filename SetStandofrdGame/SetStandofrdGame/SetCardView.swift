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
    
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            shape.fill(Color.white)
            shape.strokeBorder(lineWidth: 3)
        }
    }
}

struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        SetCardView(card: SetCard(id: 1, cardColor: .red, cardSymbol: .rect, cardCount: .one, cardFill: .filled))
    }
}
