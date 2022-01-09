//
//  SymbolView.swift
//  SetStandofrdGame
//
//  Created by Denys on 09.01.2022.
//

import SwiftUI

struct SymbolView: View {
    
    let color = Color.red
    
    var body: some View {
        ZStack {
            Ellipse().fill(color.opacity(0.5)).overlay(Rectangle().strokeBorder(lineWidth: 3).foregroundColor(.red))
        }.frame(width: 200, height: 100)
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView()
    }
}
