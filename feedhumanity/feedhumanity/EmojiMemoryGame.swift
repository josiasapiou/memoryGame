//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Josias Apiou on 6/23/20.
//  Copyright © 2020 Josias Apiou. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
   @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
  static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🍅","🌽","🍉","🍌","🥔"]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
   
       
    // MARK: - Acess to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card){
        
    model.choose(card: card)
    }
}


