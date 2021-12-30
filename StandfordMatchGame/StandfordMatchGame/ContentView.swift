//
//  ContentView.swift
//  StandfordMatchGame
//
//  Created by Denys on 29.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    let emojies = ["🚘","🚔","🚅","✈️","🦼", "🛴", "🛵",
                   "🚲", "🛺", "🚍", "🚡", "🚠", "🚃", "🚝", "🛩", "🛰"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojies[0..<emojiCount], id: \.self){ value in
                        CardView(text: value).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }){
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojies.count {
                emojiCount += 1
            }
        }){
            Image(systemName: "plus.circle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct CardView: View {
    
    let text : String
    
    @State var faceUp = false
    
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
        .onTapGesture {
            faceUp.toggle()
        }
    }
}
