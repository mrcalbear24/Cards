//
//  PlayingCardView.swift
//  Cards
//
//  Created by Farid Skywalker on 6/10/22.
//

import Foundation
import UIKit

public final class PlayingCardView: UIView {
  private let suitImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    let image = UIImage(systemName: "suit.heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
    imageView.image = image
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let topLeftCardValueWithSuit: CardValueWithSuitView = {
    let view = CardValueWithSuitView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let topRightCardValueWithSuit: CardValueWithSuitView = {
    let view = CardValueWithSuitView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let bottomLeftCardValueWithSuit: CardValueWithSuitView = {
    let view = CardValueWithSuitView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
    return view
  }()
  
  private let bottomRightCardValueWithSuit: CardValueWithSuitView = {
    let view = CardValueWithSuitView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
    return view
  }()
  
  private enum Constants {
    static let cornerContentHeight = CGFloat(125)
    static let centerContentHeight = CGFloat(250)
      
    static let widthMultiplier: CGFloat = 0.12
    static let heightMultipler: CGFloat = 0.2
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    backgroundColor = .white
    
    addSubviews()
    addConstraints()
  }
  
  func addSubviews() {
    addSubview(topLeftCardValueWithSuit)
    addSubview(topRightCardValueWithSuit)
    addSubview(bottomLeftCardValueWithSuit)
    addSubview(bottomRightCardValueWithSuit)
    
    addSubview(suitImageView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      // Centered Suit
      suitImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      suitImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      suitImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
      suitImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
      
      // Top Left
      topLeftCardValueWithSuit.leadingAnchor.constraint(equalTo: leadingAnchor),
      topLeftCardValueWithSuit.topAnchor.constraint(equalTo: topAnchor),
      topLeftCardValueWithSuit.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
      topLeftCardValueWithSuit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constants.heightMultipler),
      
      // Top Right
      topRightCardValueWithSuit.trailingAnchor.constraint(equalTo: trailingAnchor),
      topRightCardValueWithSuit.topAnchor.constraint(equalTo: topAnchor),
      topRightCardValueWithSuit.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
      topRightCardValueWithSuit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constants.heightMultipler),
      
      // Bottom Left
      bottomLeftCardValueWithSuit.leadingAnchor.constraint(equalTo: leadingAnchor),
      bottomLeftCardValueWithSuit.bottomAnchor.constraint(equalTo: bottomAnchor),
      bottomLeftCardValueWithSuit.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
      bottomLeftCardValueWithSuit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constants.heightMultipler),
      
      // Bottom Right
      bottomRightCardValueWithSuit.trailingAnchor.constraint(equalTo: trailingAnchor),
      bottomRightCardValueWithSuit.bottomAnchor.constraint(equalTo: bottomAnchor),
      bottomRightCardValueWithSuit.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
      bottomRightCardValueWithSuit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constants.heightMultipler),
    ])
  }
  
  public func apply(card: Card) {
    
    // SUIT IMAGE VIEW
    let suitName = card.suit.rawValue
    let color = card.suit.color
    suitImageView.image = UIImage(systemName: suitName)?.withTintColor(color, renderingMode: .alwaysOriginal)
    
    // CORNERS
    topRightCardValueWithSuit.apply(card: card)
    topLeftCardValueWithSuit.apply(card: card)
    bottomRightCardValueWithSuit.apply(card: card)
    bottomLeftCardValueWithSuit.apply(card: card)
  }
}
