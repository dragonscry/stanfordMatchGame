//
//  ContentView.swift
//  StandfordMatchGame
//
//  Created by Denys on 29.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    let emojies = ["🚘","🚔","🚅","✈️"]
    
    var body: some View {
        HStack {
            ForEach(0..<emojies.count){ value in
                CardView(text: emojies[value])
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("\(text)")
                .font(.largeTitle)
        }
    }
}
