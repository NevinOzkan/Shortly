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
   
    func configureCell(original: String?, short: String?) {
            longURL.text = original ?? "Bilgi yok"
            shortURL.text = short ?? "Bilgi yok"
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
           
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
        }
       
    @IBAction func copyClicked(_ sender: Any) {
        
        
    }
}
