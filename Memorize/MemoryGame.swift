//
//  MemoryGame.swift
//  Memorize
//
//  Created by Loi Pham on 4/2/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>();
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
}
