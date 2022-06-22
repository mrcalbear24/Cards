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
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
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
      suitImageView.heightAnchor.constraint(equalToConstant: Constants.centerContentHeight),
      suitImageView.widthAnchor.constraint(equalToConstant: Constants.centerContentHeight),

      
      // Top Left
      topLeftCardValueWithSuit.leadingAnchor.constraint(equalTo: leadingAnchor),
      topLeftCardValueWithSuit.topAnchor.constraint(equalTo: topAnchor),
      topLeftCardValueWithSuit.heightAnchor.constraint(equalToConstant: Constants.cornerContentHeight),
      topLeftCardValueWithSuit.widthAnchor.constraint(equalToConstant: Constants.cornerContentHeight),

      
      
      // Top Right
      topRightCardValueWithSuit.trailingAnchor.constraint(equalTo: trailingAnchor),
      topRightCardValueWithSuit.topAnchor.constraint(equalTo: topAnchor),
      topRightCardValueWithSuit.heightAnchor.constraint(equalToConstant: Constants.cornerContentHeight),
      topRightCardValueWithSuit.widthAnchor.constraint(equalToConstant: Constants.cornerContentHeight),
      
      // Bottom Left
      bottomLeftCardValueWithSuit.leadingAnchor.constraint(equalTo: leadingAnchor),
      bottomLeftCardValueWithSuit.bottomAnchor.constraint(equalTo: bottomAnchor),
      bottomLeftCardValueWithSuit.heightAnchor.constraint(equalToConstant: Constants.cornerContentHeight),
      bottomLeftCardValueWithSuit.widthAnchor.constraint(equalToConstant: Constants.cornerContentHeight),
      
      // Bottom Right
      bottomRightCardValueWithSuit.trailingAnchor.constraint(equalTo: trailingAnchor),
      bottomRightCardValueWithSuit.bottomAnchor.constraint(equalTo: bottomAnchor),
      bottomRightCardValueWithSuit.heightAnchor.constraint(equalToConstant: Constants.cornerContentHeight),
      bottomRightCardValueWithSuit.widthAnchor.constraint(equalToConstant: Constants.cornerContentHeight)
    ])
  }
}
