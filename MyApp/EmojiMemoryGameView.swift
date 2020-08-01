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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(120 - 90), clockwise: true)
                    .padding(5).opacity(0.9)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }

    // MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(emojiMemoryGame: game)
    }
}

