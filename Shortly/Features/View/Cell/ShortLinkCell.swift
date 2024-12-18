//
//  ShortLinkCell.swift
//  Shortly
//
//  Created by Nevin Özkan on 18.12.2024.
//

import UIKit

class ShortLinkCell: UITableViewCell {

    
    @IBOutlet weak var originalLink: UILabel!
    @IBOutlet weak var shortLink: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var delegateIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func copyClicked(_ sender: Any) {
    }
}
