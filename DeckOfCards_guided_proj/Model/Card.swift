//
//  DeckDictionary.swift
//  DeckOfCards_guided_proj
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation

//conform to decodable protocol
struct DeckDictionary: Decodable {
    
    //Deck Properties
    //the name of the constant in Swift 4 is automatically associated with the key name of the json dict
    let cards: [Card]
    
}

struct Card: Decodable {
    //Card Properties
    let value: String
    let suit: String
    let image: String
    
}

