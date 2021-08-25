//
//  ViewController.swift
//  Keychain
//
//  Created by Владислав on 25.08.2021.
//

import UIKit
import Locksmith

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cardNumberField: UITextField!
    @IBOutlet weak var cardDateField: UITextField!
    @IBOutlet weak var cardCVVField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: "UserAccount") else {
            return
        }
        
        cardNumberField.text = dictionary["cardNumber"] as? String
        cardDateField.text = dictionary["cardDate"] as? String
        cardCVVField.text = dictionary["cardCVV"] as? String
    }


    @IBAction func saveCard(_ sender: UIButton) {
        if let cardNumber = cardNumberField.text,
           let cardDate = cardDateField.text,
           let cardCVV = cardCVVField.text {
            
            do {
                try Locksmith.saveData(data: ["cardNumber" : cardNumber,
                                              "cardDate" : cardDate,
                                              "cardCVV" : cardCVV], forUserAccount: "UserAccount")
            }
            catch {
                print("Unable to save data")
            }
        }
        
    }
}

