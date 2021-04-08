//
//  PlayerViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 05/04/2021.
//

import UIKit

class PlayerViewController: UIViewController {
    
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
        
        // Permet de replacer les éléments au dessus du custom background
        playerInstructions.layer.zPosition = 1
        topBar.layer.zPosition = 1
        cardNbField.layer.zPosition = 1
        returnBtn.layer.zPosition = 1
        submitBtn.layer.zPosition = 1
        busIcon.layer.zPosition = 1
        
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
}
