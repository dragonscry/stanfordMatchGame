//
//  DiamondShape.swift
//  SetStandofrdGame
//
//  Created by Denys on 09.01.2022.
//

import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        
        var p = Path()
        p.move(to: startPoint)
        p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: startPoint)
        
        return p
    }
}
