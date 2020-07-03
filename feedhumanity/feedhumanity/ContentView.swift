//
//  ContentView.swift
//  Memorize
//
//  Created by Josias Apiou on 6/22/20.
//  Copyright © 2020 Josias Apiou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
       HStack {
        ForEach(viewModel.cards) { card in
            CardView(card: card)
        }
       }
            
        .padding()
        .foregroundColor(Color.blue)
    }
}
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            if card.isFaceUp     {
                RoundedRectangle(cornerRadius:10.0).fill(Color.white)
                                  RoundedRectangle(cornerRadius:10.0).stroke(lineWidth: 3)
                                  Text(card.content).font(Font.largeTitle)
             
            
            }
            
           else {
                  RoundedRectangle(cornerRadius:10.0).fill(Color.blue)
                            }
                }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
        
    }
}
