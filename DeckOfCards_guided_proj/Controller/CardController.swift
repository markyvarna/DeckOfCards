//
//  CardController.swift
//  DeckOfCards_guided_proj
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation

//How to build URL
// 1) Components are /
// 2) Query Items are [:]
// 3) Extensions are .

class CardController {
    
    //shared instance
    static let shared = CardController()
    //this makes a true singleton that way there is only one instance of this class
    private init() {}
    
    // https://deckofcardsapi.com/api/deck/<<deck_id>>/draw/?count=1
    private let baseURLString = "https://deckofcardsapi.com/api/deck"
    
    //MARK: - Fetch Card Func
    //we need to return void to help the @escaping escape the code
    func fetchCard(count: Int, completion: @escaping ([Card]?) -> Void) {
        
        //make the string value url into an actual URL
        guard  let baseURL = URL(string: baseURLString) else {
            //break code and dont continue
            fatalError("🤬   Bad base url   🤬")
        }
        
        //Add component ( "/" )
        let newURL = baseURL.appendingPathComponent("new").appendingPathComponent("draw")
        //Build URL - by adding components
        var components = URLComponents(url: newURL, resolvingAgainstBaseURL: true)
        //this is the dictionary of the users search term. When they hit the draw button
        let queryItems = URLQueryItem(name: "count", value: "\(count)")
        //finally from the query items we get the URL, if you want more query items this is where we would add them
        components?.queryItems = [queryItems]
        
        //This is the Final Request URL
        guard let url = components?.url else {completion([]); return}
        
        //URLSession
        print("😁 \(Thread.isMainThread)")
        //data task with url has the HTTP protocol GET built within it, dont forget to add .resume() at end of closure
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //1) Handle Error
            if let error = error {
                print("🤬There was an error fetching from dataTask \(#function) \(error)🤬")
                completion([]); return
            }
            
            //2) Handle your data - typically it should be named data here...
            guard let dataThatCameBack = data else {completion([]); return}
            
            //3) Use JSONDecoder to decode your object
            do {
                let cards = try JSONDecoder().decode(DeckDictionary.self, from: dataThatCameBack).cards
                completion(cards)
            } catch {
                print("There was an error decoding our card object \(error) \(error.localizedDescription)")
                completion([]); return
            }
            }.resume()
        
    }
    
}
