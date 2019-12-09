//
//  InfoViewController.swift
//  recipieApp
//
//  Created by Dace Laizane on 09/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    private let primaryColor = UIColor(red: 20/255, green: 204/255, blue: 255/255, alpha: 0.5)
       
       private let secondaryColor = UIColor(red: 20/255, green: 150/255, blue: 50/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        let defaults = UserDefaults.standard
            defaults.synchronize()
        
    }
    
}//end VC


extension UIViewController {
    
    func addVerticalGradient(topColor: UIColor, bottomColor: UIColor){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
