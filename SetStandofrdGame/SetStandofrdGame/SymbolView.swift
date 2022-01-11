//
//  SymbolView.swift
//  SetStandofrdGame
//
//  Created by Denys on 09.01.2022.
//

import SwiftUI

struct SymbolView: View {
    
    let color : Color
    let shape : cardSymbol
    let cardFill : Color
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                switch shape {
                case .diamond:
                    DiamondShape().fill(cardFill).overlay(DiamondShape().stroke(lineWidth: 3).fill(color))
                case .rect:
                    Rectangle().fill(cardFill).overlay(Rectangle().stroke(lineWidth: 3).fill(color))
                case .oval:
                    Ellipse().fill(cardFill).overlay(Ellipse().stroke(lineWidth: 3).fill(color))
                }
            }
        }
    }
}
