//
//  Card.swift
//  Concentration
//
//  Created by Andrew  on 8/4/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var wasSeen = false
    var identifier: Int
    
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
