//
//  ResultViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 18/04/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var gl:CAGradientLayer = CAGradientLayer()
    
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultSubTitleQuote: UILabel!
    @IBOutlet weak var sipNumber: UILabel!
    @IBOutlet weak var sipQuote: UILabel!
    @IBOutlet weak var kdoQuote: UILabel!
    @IBOutlet weak var topBar: UIView!
    
    // Couleurs du dégradé du custom background
    let firstGradientColor = UIColor.rgba(r: 162.0, g: 166.0, b: 180.0, a: 1).cgColor
    let secondGradientColor = UIColor.rgba(r: 105.0, g: 109.0, b: 125.0, a: 1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createBgGradient()
        putElementsInForeground()
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
