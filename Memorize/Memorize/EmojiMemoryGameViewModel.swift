//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Loi Pham on 4/2/21.
//

import Foundation
import SwiftUI


// ObservableObject only works for classes
class EmojiMemoryGameViewModel : ObservableObject {
    @Published private var viewModel: EmojiMemoryGameModel<String> = createMemoryGame()
    
    static func createMemoryGame() -> EmojiMemoryGameModel<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "💀", "🧚‍♀️", "🧛", "👹", "👺", "🧝", "🧞‍♀️", "🤖", "🦉", "🍫", "🍭", "🏚", "🌚", "👾"]
        return EmojiMemoryGameModel<String>(numberOfPairsOfCards: Int.random(in: 2...5)) {
            pairIndex in emojis[pairIndex % emojis.count]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<EmojiMemoryGameModel<String>.Card> {
        viewModel.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: EmojiMemoryGameModel<String>.Card) {
        viewModel.choose(card: card)
    }
}
