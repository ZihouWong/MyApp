//
//  ContentView.swift
//  MyApp
//
//  Created by Zihou Wong on 7/18/20.
//  Copyright © 2020 Zihou Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var clickCount = 0
    var body: some View {
        HStack {
            ForEach (0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text("😈")
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
