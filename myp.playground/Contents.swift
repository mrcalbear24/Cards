import UIKit
import PlaygroundSupport

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
    label.contentMode = .scaleAspectFit
    label.font = UIFont.boldSystemFont(ofSize: 75)
    label.minimumScaleFactor = 0.1
    
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
}

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
}

let card = PlayingCardView()
card.frame = CGRect(x: 0, y: 0, width: 200, height: 300)

PlaygroundPage.current.liveView = card









