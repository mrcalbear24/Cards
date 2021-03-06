//
//  ViewController.swift
//  Cards
//
//  Created by Farid Skywalker on 6/10/22.
//

import UIKit

class PlayingCardViewController: UIViewController {

  private let cardValueWithSuit: PlayingCardView = {
    let view = PlayingCardView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(cardValueWithSuit)
    
    
    NSLayoutConstraint.activate([
//      cardValueWithSuit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//      cardValueWithSuit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//      cardValueWithSuit.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//      cardValueWithSuit.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
      
      cardValueWithSuit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cardValueWithSuit.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      cardValueWithSuit.widthAnchor.constraint(equalToConstant: 200),
      cardValueWithSuit.heightAnchor.constraint(equalToConstant: 300)
    ])
    // Do any additional setup after loading the view.
  }
}

