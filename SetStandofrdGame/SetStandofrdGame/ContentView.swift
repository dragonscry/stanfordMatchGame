//
//  ContentView.swift
//  SetStandofrdGame
//
//  Created by Denys on 08.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : SetModelView
    
    @State var emptyDeck = [SetCard]()
    
    @Namespace private var dealingNamespace
    
    var body: some View {
        VStack{
            Text("Your current score is \(viewModel.score())")
            Text("Cards in deck \(viewModel.cardCountInFullDeck())")
            if !viewModel.cards.isEmpty {
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                SetCardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(2)
                    .onTapGesture {
                        withAnimation {
                            viewModel.choose(card)
                        }
                    }
                
            }
            .foregroundColor(.red)
            }
            Spacer()
            Button(action: {
                withAnimation {
                    viewModel.addThreeCards()
                }
            }){
                Text("Add three cards")
            }
            Button(action: {
                viewModel.restart()
            }){
                Text("New Game")
            }
            
            HStack {
                deckBody
                Spacer()
                emptyBody
            }
            .padding(.horizontal)
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
            //var i = 0
           for i in 0..<12 {
               withAnimation(dealAnimation(for: i)) {
                    viewModel.gameDeck()
                }
            }
        }
    }
    
    var emptyBody: some View {
        ZStack {
            ForEach(viewModel.sbros){ card in
                SetCardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
            }
        }
        .frame(width: 60, height: 90)
        .foregroundColor(.red)
    }
    
    private func dealAnimation(for int: Int) -> Animation {
        let delay = Double(int)
        return Animation.easeInOut(duration: 5).delay(delay/5)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetModelView()
        ContentView(viewModel: game)
    }
}
