//
//  ContentView.swift
//  SetStandofrdGame
//
//  Created by Denys on 08.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : SetModelView
    
    @Namespace private var dealingNamespace
    
    var body: some View {
        VStack{
            Text("Your current score is \(viewModel.score())")
            Text("Cards in deck \(viewModel.cardCountInFullDeck())")
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                SetCardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(2)
                    .onTapGesture {
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
            
            deckBody
        }
        
        
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(viewModel.fullDeck) { card in
                SetCardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                
            }
        }
        .frame(width: 60, height: 90)
        .foregroundColor(.red)
        .onTapGesture {
      //      for card in viewModel.fullDeck {
        //    for i in 0..<12 {
                withAnimation {
                    viewModel.gameDeck()
                }
        //    }
        }
    }
    
    private func dealAnimation(for int: Int) -> Animation {
          var delay = Double(int)
        return Animation.easeInOut(duration: 0.5).delay(delay)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetModelView()
        ContentView(viewModel: game)
    }
}
