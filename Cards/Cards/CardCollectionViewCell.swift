//
//  CardCollectionViewCell.swift
//  Cards
//
//  Created by Farid Skywalker on 6/21/22.
//

import Foundation
import UIKit

final class CardCollectionViewCell: UICollectionViewCell {
  private let playingCardView: PlayingCardView = {
    let view = PlayingCardView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(playingCardView)
    
    NSLayoutConstraint.activate([
      playingCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
      playingCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      playingCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      playingCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    ])
    
  }
  
  public func apply(card: Card) {
    playingCardView.apply(card: card)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
