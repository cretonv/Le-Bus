//
//  ViewController.swift
//  Le Bus
//
//  Created by Vincent Creton on 17/03/2021.
//

import UIKit

class ViewController: UIViewController {
    var gl:CAGradientLayer = CAGradientLayer()
    let firstGradientColor = UIColor.rgba(r: 212.0, g: 212.0, b: 214, a: 1).cgColor
    let secondGradientColor = UIColor.rgba(r: 169.0, g: 169.0, b: 173, a: 1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        gl.frame = self.view.bounds
//        gl.colors = [UIColor.rgba(r: 212.0, g: 212.0, b: 214, a: 1).cgColor, UIColor.rgba(r: 169.0, g: 169.0, b: 173, a: 1).cgColor]
//        self.view.layer.addSublayer(gl)
        
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [firstGradientColor, secondGradientColor]
        view.layer.addSublayer(layer)
    }


}

