//
//  ContentView.swift
//  StandfordMatchGame
//
//  Created by Denys on 29.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards, id: \.self){ card in
                        CardView(text: value).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if faceUp {
                shape.fill(.white)
                shape.stroke(lineWidth: 3)
                Text("\(text)")
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}
