//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Loi Pham on 4/2/21.
//

import Foundation
import SwiftUI



class EmojiMemoryGame {
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "💀", "🧚‍♀️", "🧛", "👹", "👺", "🧝", "🧞‍♀️", "🤖", "🦉", "🍫", "🍭", "🏚", "🌚", "👾"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) {
            pairIndex in emojis[pairIndex % emojis.count]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
