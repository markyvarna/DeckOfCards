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
    
    //MARK: - Properties
    //the name of the constant in Swift 4 is automatically associated with the key name of the json dict
    let cards: [Card]
    
    //Because of swift 4 we dont have to use this because the cards constant name matches the json
//    private enum CodingKeys: String, CodingKey {
//        case cards = "cards"
//    }
    
    struct Card: Decodable {
        //define what the card is made up of
        let value: String
        let suit: String
        let image: String
        
    }
}
