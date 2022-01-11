//
//  ContentView.swift
//  SetStandofrdGame
//
//  Created by Denys on 08.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : SetModelView
    
    var body: some View {
        VStack{
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                SetCardView(card: card).padding(2)
            }
            Button(action: {
                viewModel.addThreeCards()
            }){
                Text("Add three cards")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetModelView()
        ContentView(viewModel: game)
    }
}
