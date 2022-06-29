//
//  Suits.swift
//  Cards
//
//  Created by Farid Skywalker on 6/24/22.
//

import Foundation
import UIKit

public enum Suit: String, CaseIterable {
  case heart = "suit.heart.fill"
  case spade = "suit.spade.fill"
  case club = "suit.club.fill"
  case diamond = "suit.diamond.fill"
  
  var color: UIColor {
    switch self {
    case .heart, .diamond:
      return .red
    case .spade, .club:
      return .black
    }
  }
}
