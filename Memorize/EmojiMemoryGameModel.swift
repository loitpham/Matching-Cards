//
//  EmojiMemoryGameModel.swift
//  Memorize
//
//  Created by Loi Pham on 4/2/21.
//

import Foundation

struct EmojiMemoryGameModel<CardContent> {
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
    
    mutating func choose(card: Card) {
        print("Before: card chosen: \(card)")
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        print("After: card status: \(cards[chosenIndex])")
    }
    
    // external name: 'of'
    // internal name: 'card'
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: replace 0 with some NotFound constant
    }
}
