//
//  ContentView.swift
//  MyApp
//
//  Created by Zihou Wong on 7/18/20.
//  Copyright © 2020 Zihou Wong. All rights reserved.
//

// MARK: - View
import SwiftUI

struct EmojiMemoryGameView: View {
    
    // emojiMemoryGame is a viewmodel
    var emojiMemoryGame: EmojiMemoryGame
    
    var clickCount = 0
    var body: some View {
        HStack {
            ForEach (emojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    self.emojiMemoryGame.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame())
    }
}
