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
    
    @IBOutlet weak var busPart0: UIView!
    @IBOutlet weak var busPart1: UIView!
    @IBOutlet weak var busPart2: UIView!
    @IBOutlet weak var busPart3: UIView!
    @IBOutlet weak var busPart4: UIView!
    @IBOutlet weak var busPart5: UIView!
    @IBOutlet weak var busPart6: UIView!
    @IBOutlet weak var busPart7: UIView!
    @IBOutlet weak var busPart8: UIView!
    
    @IBOutlet weak var busWheels0: UIView!
    @IBOutlet weak var busWheels1: UIView!
    @IBOutlet weak var busWheels2: UIView!
    @IBOutlet weak var busWheels3: UIView!
    
    @IBOutlet weak var topBusPart: UIView!
    @IBOutlet weak var topBusDecoration: UIView!
    
    @IBOutlet weak var loseBtn: UIButton!
    @IBOutlet weak var winBtn: UIButton!
    
    @IBOutlet weak var traillingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    // Couleurs du dégradé du custom background
    let firstGradientColor = UIColor.rgba(r: 162.0, g: 166.0, b: 180.0, a: 1).cgColor
    let secondGradientColor = UIColor.rgba(r: 105.0, g: 109.0, b: 125.0, a: 1).cgColor
    
    var sideBarIsOpen: Bool = false
    var busParts: Array<UIView>? = nil
    var busWheels: Array<UIView>? = nil
    
    var waitResult: Bool = false
    var currentRank: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeArrowClickable()
        createBgGradient()
        
        cardView.layer.cornerRadius = 29
        drawButton.layer.cornerRadius = 8
        rightCornerCardValue.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        reverseNavArrow.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        busParts = [busPart0, busPart1, busPart2, busPart3, busPart4, busPart5, busPart6, busPart7, busPart8]
        roundedBusParts()
        
        busWheels = [busWheels0, busWheels1, busWheels2, busWheels3]
        roundedWheels()
        
        changeAllToPassiveColor()
        
        initResponseBtnStyle(btn: loseBtn)
        initResponseBtnStyle(btn: winBtn)
        
        topBusPart.layer.cornerRadius = 5
        topBusDecoration.layer.cornerRadius = 4
        
        leadingConstraint.constant = UIScreen.main.bounds.width
        traillingConstraint.constant += -215
        
        formatCard()
        
        putElementsInForeground()
        
        createShadowCard()
        createShadowSidebar()
        createShadowTopBar()
        
        initBusValues()
        updateRank()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    /**
     Arrondis les 9 parties du bus
     */
    func roundedBusParts() {
        if let busPartsCollection = busParts {
            for busPart in busPartsCollection {
                busPart.layer.cornerRadius = 5
            }
        }
    }
    
    /**
     Arrondis les roues du bus
     */
    func roundedWheels() {
        if let wheels = busWheels {
            for singleWheels in wheels {
                singleWheels.layer.cornerRadius = 4
            }
        }
    }
    
    /**
     Remet tous les éléments au dessus du dégradé de background
     */
    func putElementsInForeground() {
        cardView.layer.zPosition = 1
        topBar.layer.zPosition = 3
        drawButton.layer.zPosition = 1
        rankLabel.layer.zPosition = 1
        navArrow.layer.zPosition = 1
        navModal.layer.zPosition = 2
        loseBtn.layer.zPosition = 1
        winBtn.layer.zPosition = 1
    }
    
    /**
     Formate le contenus de la carte au défaut
     */
    func formatCard() {
        leftCornerCardValue.text = "D"
        rightCornerCardValue.text = "D"
        centerCardValue.text = "D"
    }
    
    /**
     Rends les flêches de la sidebar
     */
    func makeArrowClickable() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMenu(tapGestureRecognizer:)))
        navArrow.isUserInteractionEnabled = true
        navArrow.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizerBis = UITapGestureRecognizer(target: self, action: #selector(showMenu(tapGestureRecognizer:)))
        reverseNavArrow.isUserInteractionEnabled = true
        reverseNavArrow.addGestureRecognizer(tapGestureRecognizerBis)
    }
    
    /**
     Créé le custom gradient bacjkground de la view
     */
    func createBgGradient() {
        gl.frame = self.view.bounds
        gl.colors = [firstGradientColor, secondGradientColor]
        gl.zPosition = 0
        view.layer.addSublayer(gl)
    }
    
    /**
     Créé l'ombre de la topBar
     */
    func createShadowTopBar() {
        topBar.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        topBar.layer.shadowOpacity = 0.26
        topBar.layer.shadowOffset = .zero
        topBar.layer.shadowRadius = 10
    }
    
    /**
     Créé l'ombre de la card
     */
    func createShadowCard() {
        cardView.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        cardView.layer.shadowOpacity = 0.35
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 10
    }
    
    /**
     Créé l'ombre de la sidebar ouverte
     */
    func createShadowSidebar() {
        navModal.layer.shadowColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1).cgColor
        navModal.layer.shadowOpacity = 0.32
        navModal.layer.shadowOffset = .zero
        navModal.layer.shadowRadius = 10
    }
    
    /**
     Permet de récupérer les labels contenus dans une view
     */
    func getLabelsInView(view: UIView) -> [UILabel] {
        var results = [UILabel]()
        for subview in view.subviews as [UIView] {
            if let labelView = subview as? UILabel {
                results += [labelView]
            } else {
                results += getLabelsInView(view: subview)
            }
        }
        return results
    }
    
    func initBusValues() {
        if let parts = busParts {
            for busPart in parts {
                getLabelsInView(view: busPart)[0].text = String(Int.random(in: 1..<9))
            }
        }
    }
    
    /**
     Fonction permettant d'initialiser les styles custom des boutons réponses
     */
    func initResponseBtnStyle(btn: UIButton) {
        btn.imageView?.contentMode = .scaleAspectFit
        btn.isHidden = true
        btn.layer.cornerRadius = 8
        btn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 0,bottom: 5,right: 0)
    }
    
    func doOnClickResponseBtn(btnClicked: UIButton) {
        changeVisibilityResponseBtn()
        drawButton.isHidden = false
        updateRank()
    }
    
    func changeVisibilityResponseBtn() {
        loseBtn.isHidden = !loseBtn.isHidden
        winBtn.isHidden = !winBtn.isHidden
    }
    
    func updateRank() {
        rankLabel.text = "Rang " + String(currentRank) + "/9"
    }
    
    /**
     Fonction permettant de rendre tout les labels du bus sauf le premier en couleur inactive
     */
    func changeAllToPassiveColor() {
        if let parts = busParts {
            for i in 1...(parts.count - 1) {
                getLabelsInView(view: parts[i])[0].textColor = UIColor.rgba(r: 228.0, g: 214.0, b: 167.0, a: 1.0)
            }
        }
    }
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
    
    @IBAction func nextCard(_ sender: UIButton) {
        let newValue: String = String(Int.random(in: 0..<9))
        
        rightCornerCardValue.fadeTransition(0.3)
        leftCornerCardValue.fadeTransition(0.3)
        centerCardValue.fadeTransition(0.3)
        
        rightCornerCardValue.text = newValue
        leftCornerCardValue.text = newValue
        centerCardValue.text = newValue
        
        waitResult = true
        sender.isHidden = true
        changeVisibilityResponseBtn()
    }
    @IBAction func touchLoseButton(_ sender: UIButton) {
        currentRank = 1
        doOnClickResponseBtn(btnClicked: sender)
    }
    @IBAction func touchWinButton(_ sender: UIButton) {
        currentRank += 1
        doOnClickResponseBtn(btnClicked: sender)
    }
}
