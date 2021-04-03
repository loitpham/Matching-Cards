//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Loi Pham on 4/2/21.
//

import SwiftUI

struct EmojiMemoryGameView: View { // thinks of : as "behaves as" rather than "is a"
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
        .font(viewModel.cards.count >= 10 ? Font.title2 : Font.largeTitle)
        
    }
}

struct CardView: View {
    var card: EmojiMemoryGameModel<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                    
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
        .aspectRatio(2.0/3.0, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}
