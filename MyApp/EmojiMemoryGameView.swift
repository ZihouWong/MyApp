//
//  EmojiMemoryGameView.swift
//  MyApp
//
//  Created by Zihou Wong on 7/18/20.
//  Copyright © 2020 Zihou Wong. All rights reserved.
//

// MARK: - View
import SwiftUI 

// Struct is a value type dosen't live in the heap
struct EmojiMemoryGameView: View {
    
    // emojiMemoryGame is a viewmodel
    @ObservedObject var emojiMemoryGame: EmojiMemoryGame
    
    var clickCount = 0
    var body: some View {
        Grid(emojiMemoryGame.cards) { card in
            CardView(card: card).onTapGesture {
                self.emojiMemoryGame.choose(card: card)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .aspectRatio(contentMode: .fit)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
        
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else {
                if !card.isMatched {
                   RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
        .padding(5)
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame())
    }
}
