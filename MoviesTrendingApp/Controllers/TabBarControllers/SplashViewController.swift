//
//  SplashViewController.swift
//  PopcornMovies
//
//  Created by Renan de Matos on 08/12/22.
//

import UIKit

class SplashViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                
                self.performSegue(withIdentifier: "Movies", sender: nil)
            }
        }
    }

