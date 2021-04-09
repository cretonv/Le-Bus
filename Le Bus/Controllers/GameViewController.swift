//
//  GameViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 08/04/2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var rightCornerCardValue: UILabel!
    @IBOutlet weak var leftCornerCardValue: UILabel!
    @IBOutlet weak var centerCardValue: UILabel!
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardView.layer.cornerRadius = 29
        drawButton.layer.cornerRadius = 8
        rightCornerCardValue.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        // Ajoute l'ombre à la top bar
        topBar.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        topBar.layer.shadowOpacity = 0.26
        topBar.layer.shadowOffset = .zero
        topBar.layer.shadowRadius = 10
        
        // Ajoute l'ombre à la carte
        cardView.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        cardView.layer.shadowOpacity = 0.35
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 10
        
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
