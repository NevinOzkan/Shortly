//
//  ShortLinkCell.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import UIKit

class ShortLinkCell: UITableViewCell {

    @IBOutlet weak var delegateIcon: UIImageView!
    @IBOutlet weak var originalLink: UILabel!
    @IBOutlet weak var shortLink: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var delegateTapped: UIView!
    
    @IBAction func copyClicked(_ sender: Any) {
    }
}
