//
//  CardDeckCollectionViewController.swift
//  Cards
//
//  Created by Farid Skywalker on 6/21/22.
//

import UIKit

final class CardDeckCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cards = CardDecks.standardDeck
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .black
    
    collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "a")
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}

// DATA SOURCE
extension CardDeckCollectionViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    cards.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "a", for: indexPath) as! CardCollectionViewCell
    
    let card = cards[indexPath.row]
    cell.apply(card: card)
    return cell
  }
}

// DELEGATE FLOW LAYOUT
extension CardDeckCollectionViewController {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 80, height: 120)
  }
}
