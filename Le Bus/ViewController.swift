//
//  ViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 17/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var gl:CAGradientLayer = CAGradientLayer()
    @IBOutlet weak var busImage: UIImageView!
    @IBOutlet weak var homeScreenTitle: UILabel!
    @IBOutlet weak var homeBaseline: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // Couleurs du dégradé du custom background
    let firstGradientColor = UIColor.rgba(r: 212.0, g: 212.0, b: 214, a: 1).cgColor
    let secondGradientColor = UIColor.rgba(r: 169.0, g: 169.0, b: 173, a: 1).cgColor
    
    // Couleurs du dégradé du bouton start
    let firstButtonColor = UIColor.rgba(r: 233, g: 180, b: 78, a: 1).cgColor
    let secondButtonColor = UIColor.rgba(r: 249, g: 137, b: 0, a: 1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Création du custom backgroud avec le dégradé gris
        gl.frame = self.view.bounds
        gl.colors = [firstGradientColor, secondGradientColor]
        gl.zPosition = 0
        view.layer.addSublayer(gl)
        
        self.startButton.applyGradient(colors: [self.firstButtonColor, self.secondButtonColor])
        
        // Permet de replacer les éléments au dessus du custom background
        homeScreenTitle.layer.zPosition = 1
        busImage.layer.zPosition = 1
        homeBaseline.layer.zPosition = 1
        startButton.layer.zPosition = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}

