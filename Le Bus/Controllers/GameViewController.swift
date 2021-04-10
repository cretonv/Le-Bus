//
//  GameViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 08/04/2021.
//

import UIKit

class GameViewController: UIViewController {

    var gl:CAGradientLayer = CAGradientLayer()
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var rightCornerCardValue: UILabel!
    @IBOutlet weak var leftCornerCardValue: UILabel!
    @IBOutlet weak var centerCardValue: UILabel!
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var navArrow: UIImageView!
    @IBOutlet weak var navModal: UIView!
    @IBOutlet weak var reverseNavArrow: UIImageView!
    
    @IBOutlet weak var traillingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    // Couleurs du dégradé du custom background
    let firstGradientColor = UIColor.rgba(r: 162.0, g: 166.0, b: 180.0, a: 1).cgColor
    let secondGradientColor = UIColor.rgba(r: 105.0, g: 109.0, b: 125.0, a: 1).cgColor
    
    var sideBarIsOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Rendre les images de fleches cliquables
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMenu(tapGestureRecognizer:)))
        navArrow.isUserInteractionEnabled = true
        navArrow.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizerBis = UITapGestureRecognizer(target: self, action: #selector(showMenu(tapGestureRecognizer:)))
        reverseNavArrow.isUserInteractionEnabled = true
        reverseNavArrow.addGestureRecognizer(tapGestureRecognizerBis)
        
        // Création du custom backgroud avec le dégradé gris
        gl.frame = self.view.bounds
        gl.colors = [firstGradientColor, secondGradientColor]
        gl.zPosition = 0
        view.layer.addSublayer(gl)
        
        cardView.layer.cornerRadius = 29
        drawButton.layer.cornerRadius = 8
        rightCornerCardValue.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        reverseNavArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
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
        
        // Ajoute l'ombre à la sideBar
        navModal.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        navModal.layer.shadowOpacity = 0.32
        navModal.layer.shadowOffset = .zero
        navModal.layer.shadowRadius = 10
        
        // Définition de l'index de tous les composants à 1
        cardView.layer.zPosition = 1
        topBar.layer.zPosition = 3
        drawButton.layer.zPosition = 1
        rankLabel.layer.zPosition = 1
        navArrow.layer.zPosition = 1
        navModal.layer.zPosition = 2
        
        leftCornerCardValue.text = "D"
        rightCornerCardValue.text = "D"
        centerCardValue.text = "D"
        
        leadingConstraint.constant += 215
        traillingConstraint.constant += -215
        
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

    @objc func showMenu(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if sideBarIsOpen {
            leadingConstraint.constant += 215
            traillingConstraint.constant += -215
        } else {
            leadingConstraint.constant += -215
            traillingConstraint.constant += 215
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        sideBarIsOpen = !sideBarIsOpen
    }
}
