//
//  StandardDeck.swift
//  Cards
//
//  Created by Farid Skywalker on 6/29/22.
//

import Foundation

struct CardDecks {
  static var standardDeck: [Card] {
    var cards: [Card] = []
    
    for suit in Suit.allCases {
      for value in Value.allCases {
        
        let card = Card(suit: suit, value: value, color: suit.color)
        cards.append(card)
      }
    }
    return cards
  }
}
