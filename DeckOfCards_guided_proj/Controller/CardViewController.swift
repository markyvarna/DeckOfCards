//
//  CardViewController.swift
//  DeckOfCards_guided_proj
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var suitLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addVerticalGradientLayer(topColor: .green, bottomColor: .gray)
    }
    
    //MARK: - Actions
    
    @IBAction func drawButtonTapped(_ sender: UIButton) {
        
        updateViews()
    }
    
    func updateViews() {
        
        CardController.shared.fetchCard(count: 1) { (cards) in
            // Put card on main thread
            DispatchQueue.main.async {
                guard let card = cards?.first else {return}
                self.suitLabel.text = card.suit
                self.valueLabel.text = card.value
                
                CardController.shared.fetchCardImage(card: card, completion: { (image) in
                    DispatchQueue.main.async {
                        self.cardImageView.image = image
                    }
                    
                })
                
            }
            
        }
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
