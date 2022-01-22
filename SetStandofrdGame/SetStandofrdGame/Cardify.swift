//
//  Cardify.swift
//  SetStandofrdGame
//
//  Created by Denys on 21.01.2022.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill(.white)
            }
            else {
                shape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0)
            shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
        
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
