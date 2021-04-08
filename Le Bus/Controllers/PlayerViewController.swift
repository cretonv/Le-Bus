//
//  PlayerViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 05/04/2021.
//

import UIKit

class PlayerViewController: UIViewController, UITextFieldDelegate {
    
    var cardNbValue: Int?
    
    @IBOutlet weak var playerInstructions: UILabel!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var cardNbField: UITextField!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var busIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        
        // Ajoute l'ombre à la top bar
        topBar.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        topBar.layer.shadowOpacity = 0.26
        topBar.layer.shadowOffset = .zero
        topBar.layer.shadowRadius = 10
        
        returnBtn.layer.cornerRadius = 8
        submitBtn.layer.cornerRadius = 8
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Les 2 fonctions suivantes vont nous permettre de faire disparaitre la navigation bar quand cette vue est affichée
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func toGameScreen(_ sender: UIButton) {
        let canGo: Bool = getValue()
        if canGo {
            if let value = cardNbValue {
                DataContainer.sharedInstance.cardsNumber = value
                performSegue(withIdentifier: "toGame", sender: AnyObject.self)
            }
        } else {
            return
        }
    }
    
    func getValue() -> Bool {
        if let cardNb = cardNbField.text {
            if let cardNbInt = Int(cardNb) {
                if (cardNbInt >= 100) && (cardNbInt <= 200) {
                    cardNbValue = cardNbInt
                    return true
                } else {
                    showSimpleAlert()
                    return false
                }
            } else {
                showSimpleAlert()
                return false
            }
        } else {
            showSimpleAlert()
            return false
        }
    }
    
    /**
     Simple Alert
     - Alerte utilisé pour signaler que la valeur entrée ne respecte pas les conditions
    */
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Erreur",
                                      message: "La valeur rentrée ne respecte pas les condtions ",
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
