//
//  ViewController.swift
//  Concentration
//
//  Created by Andrew  on 8/3/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (сardButtonsOutletCollection.count + 1) / 2)
    var flipCount = 0 { didSet { flipCountLable.text = "Flips: \(flipCount)" } }
    
    @IBOutlet var сardButtonsOutletCollection: [UIButton]!
    @IBOutlet weak var flipCountLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make the corners of the cards round
        for card in сardButtonsOutletCollection {
            card.layer.cornerRadius = 20
        }
        
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = сardButtonsOutletCollection.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }
        
        
    }
    
    @IBAction func startNewGameButton(_ sender: Any) {
        flipCount = 0
        game.resetGame(numberOfPairsOfCards: (сardButtonsOutletCollection.count + 1) / 2)
        
        updateViewFromModel()
    }
    
    
    func updateViewFromModel() {
        for index in сardButtonsOutletCollection.indices {
            let button = сardButtonsOutletCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 0) : #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            }
        }
    }
    var emojiChoices = ["🧟‍♂️", "🧟‍♀️", "💀" ,"☠️", "👁", "👀", "😈", "👹", "🤡", "🎃", "🦇", "🔮", "👻", "🕸", "🕷", "👿", "👺"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

