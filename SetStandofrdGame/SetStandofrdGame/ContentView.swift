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
            Text("\(viewModel.cards.count)")
                .padding()
            Button(action: {
                viewModel.addThreeCards()
            }){
                Text("Add three cards")
            }
            Button(action: {
                viewModel.restart()
            }){
                Text("RESTART")
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
