//
//  ResultViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 18/04/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var gl:CAGradientLayer = CAGradientLayer()
    var isWin: Bool? = nil
    
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultSubTitleQuote: UILabel!
    @IBOutlet weak var sipNumber: UILabel!
    @IBOutlet weak var sipQuote: UILabel!
    @IBOutlet weak var kdoQuote: UILabel!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var returnHomeBtn: UIButton!
    
    // Couleurs du dégradé du bouton return
    let firstButtonColor = UIColor.rgba(r: 233, g: 180, b: 78, a: 1).cgColor
    let secondButtonColor = UIColor.rgba(r: 249, g: 137, b: 0, a: 1).cgColor
    
    // Couleurs du dégradé du custom background
    let firstGradientColor = UIColor.rgba(r: 162.0, g: 166.0, b: 180.0, a: 1).cgColor
    let secondGradientColor = UIColor.rgba(r: 105.0, g: 109.0, b: 125.0, a: 1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createBgGradient()
        putElementsInForeground()
        
        if(DataContainer.sharedInstance.isWin) {
            resultSubTitleQuote.text = "Attention à la punition pour le dernier donneur"
            sipNumber.text = String(Int.random(in: 0...22))
        } else {
            sipNumber.text = String(Int.random(in: 0...12))
        }
        
        // Permet de créer le gradient en fond du bouton
        self.returnHomeBtn.applyGradient(colors: [self.firstButtonColor, self.secondButtonColor])
    }
    
    /**
     Créé le custom gradient background de la view
     */
    func createBgGradient() {
        gl.frame = self.view.bounds
        gl.colors = [firstGradientColor, secondGradientColor]
        gl.zPosition = 0
        view.layer.addSublayer(gl)
    }
    
    /**
     Remet tous les éléments au dessus du dégradé de background
     */
    func putElementsInForeground() {
        resultTitle.layer.zPosition = 1
        topBar.layer.zPosition = 3
        resultSubTitleQuote.layer.zPosition = 1
        sipNumber.layer.zPosition = 1
        sipQuote.layer.zPosition = 1
        kdoQuote.layer.zPosition = 1
        returnHomeBtn.layer.zPosition = 1
        
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
