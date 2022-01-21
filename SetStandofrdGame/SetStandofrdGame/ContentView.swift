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
            Text("Your current score is \(viewModel.score())")
            Text("Cards in deck \(viewModel.cardCountInFullDeck())")
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                SetCardView(card: card).padding(2).onTapGesture {
                    viewModel.choose(card)
                }
            }
            .foregroundColor(.red)
            Button(action: {
                viewModel.addThreeCards()
            }){
                Text("Add three cards")
            }
            Button(action: {
                viewModel.restart()
            }){
                Text("New Game")
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
