//
//  ShortLinkCell.swift
//  Shortly
//
//  Created by Nevin Özkan on 17.12.2024.
//

import UIKit

class ShortLinkCell: UITableViewCell {
    
    
    @IBOutlet weak var longURL: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var shortURL: UILabel!
    @IBOutlet weak var delegateIcon: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    @objc func delImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        
    }
    
    @IBAction func copyClicked(_ sender: Any) {
    }
}
