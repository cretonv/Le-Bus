//
//  MenuViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 18/04/2021.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuHelpBtn: UIButton!
    @IBOutlet weak var burgerBtn: UIImageView!
    
    // Couleurs du dégradé du bouton help
    let firstButtonColor = UIColor.rgba(r: 233, g: 180, b: 78, a: 1).cgColor
    let secondButtonColor = UIColor.rgba(r: 249, g: 137, b: 0, a: 1).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.menuHelpBtn.applyGradient(colors: [self.firstButtonColor, self.secondButtonColor])
        self.menuHelpBtn.layer.sublayers?[0].cornerRadius = 4
        self.menuHelpBtn.setTitleColor(UIColor.black, for: .normal)
        
        
        let tapGestureRecognizerForGoBack = UITapGestureRecognizer(target: self, action: #selector(goPreviousView(tapGestureRecognizer:)))
        burgerBtn.isUserInteractionEnabled = true
        burgerBtn.addGestureRecognizer(tapGestureRecognizerForGoBack)
        
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
    
    @objc func goPreviousView(tapGestureRecognizer: UITapGestureRecognizer) {
        _ = navigationController?.popViewController(animated: true)
    }

}
