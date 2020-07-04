//
//  ContentView.swift
//  Memorize
//
//  Created by Josias Apiou on 6/22/20.
//  Copyright © 2020 Josias Apiou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
       HStack {
        ForEach(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        }
       }
            
        .padding()
        .foregroundColor(Color.blue)
       .font(Font.largeTitle)
    }
}
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
        }
    func body(for size: CGSize) -> some View {
        ZStack {
            if  card.isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content).font(Font.largeTitle)
                }
            
           else {
                  RoundedRectangle(cornerRadius:10.0).fill(Color.blue)
            }
        }
        .font(Font.system(size: fontSize(for: size) ))
        
    }
        

let cornerRadius: CGFloat = 10.0
let edgeLineWidth: CGFloat = 3
func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.75
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
        
    }
}
}

