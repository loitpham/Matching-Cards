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
        GridView(items: viewModel.cards) {card in
                CardView(card: card)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
                    .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: EmojiMemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.white)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: edgeLineWidth)
                        
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill()
                }
            }
//            .aspectRatio(2.0/3.0, contentMode: .fit)
            .font(Font.system(size: fontSize(for: geometry.size)))
        })
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3   
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}
