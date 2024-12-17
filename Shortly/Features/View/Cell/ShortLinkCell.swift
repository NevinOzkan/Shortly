//
//  ShortLinkCell.swift
//  Shortly
//
//  Created by Nevin Özkan on 17.12.2024.
//

import UIKit

class ShortLinkCell: UITableViewCell {
    
    
    @IBOutlet weak var originalLink: UILabel!
    @IBOutlet weak var shortLink: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var delegateIcon: UIImageView!
    
    
    func configureCell(original: String?, short: String?) {
        originalLink.text = original ?? "Bilgi yok"
        shortLink.text = short ?? "Bilgi yok"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(delImageTapped(tapGestureRecognizer:)))
        delegateIcon.isUserInteractionEnabled = true
        delegateIcon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func delImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        
    }
    
    @IBAction func copyClicked(_ sender: Any) {
        UIPasteboard.general.string = shortLink.text
        copyButton.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        copyButton.setTitle("COPIED",for: .normal)
        copyButton.titleLabel?.textColor = .blue
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Başarılı", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))

        if let viewController = self.window?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
