//
//  OnboardingPage2VC.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import UIKit

class OnboardingPage2VC: UIViewController {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var ımageDescription: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func skipButton(_ sender: Any) {
        let homeVC = HomeVC()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil) 
    }
}
