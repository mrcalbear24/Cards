//
//  CardValueWithSuitView.swift
//  Cards
//
//  Created by Farid Skywalker on 6/17/22.
//

import UIKit

final class CardValueWithSuitView: UIView {
  
  private let stackView: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.alignment = .leading
    stackView.axis = .vertical
    stackView.spacing = 0
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private let valueLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "A"
    label.textAlignment = .center
    label.textColor = .red
    label.contentMode = .center
    label.font = UIFont.boldSystemFont(ofSize: 75)
    label.minimumScaleFactor = 0.1
   // label.setContentHuggingPriority(.defaultLow, for: .vertical)
    
    // to keep it on 1 line so it can grow
    label.numberOfLines = 1
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  private let suitImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    let image = UIImage(systemName: "suit.heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
    imageView.image = image
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  // Storyboard
  required init?(coder: NSCoder) {
    fatalError("fatal error")
  }
  
  func setupView() {
    backgroundColor = .white
    
    addSubviews()
    addConstraints()
  }
  
  func addSubviews() {
    stackView.addArrangedSubview(valueLabel)
    stackView.addArrangedSubview(suitImageView)
    
    addSubview(stackView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      // Stack View
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      // Suit
      suitImageView.widthAnchor.constraint(equalTo: valueLabel.widthAnchor),
      
      // Value
      valueLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
    ])
  }
  
  public func apply(card: Card) {
    let color = card.suit.color
    let suitName = card.suit.rawValue
    
    // VALUE
    valueLabel.text = card.value.rawValue
    valueLabel.textColor = color
    
    // SUIT
    suitImageView.image = UIImage(systemName: suitName)?.withTintColor(color, renderingMode: .alwaysOriginal)
  }
}
