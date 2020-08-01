//
//  EmojiMemoryGame.swift
//  MyApp
//
//  Created by Zihou Wong on 7/22/20.
//  Copyright © 2020 Zihou Wong. All rights reserved.
//

// MARK: - ViewModel
// essentially is a UI thing
// ViewModel is a portal between view and model

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    // game is a model
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["👻","😌","👿"]
//        ,"😬","😰","🎃"
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    
    
//    MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
//    MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
//    MARK: -
    
    
}
