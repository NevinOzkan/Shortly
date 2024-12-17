//
//  OnboardingPage1VC.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import UIKit

class OnboardingPage1VC: UIViewController {
    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var illustrationImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func startTapped(_ sender: Any) {
        let onboardingPageVC = OnboardingPageVC(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        onboardingPageVC.modalPresentationStyle = .fullScreen
        present(onboardingPageVC, animated: true, completion: nil)
    }
}
