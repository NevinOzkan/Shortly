//
//  OnboardingCell.swift
//  Shortly
//
//  Created by Nevin Özkan on 21.12.2024.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
