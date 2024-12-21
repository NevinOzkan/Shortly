//
//  HistoryVC.swift
//  Shortly
//
//  Created by Nevin Özkan on 17.12.2024.
//

import UIKit
import SwiftData

class HistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var container: ModelContainer?
    var shortLinks: [ShortLink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadShortLinks()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: "ShortLinkCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ShortLinkCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    //Verileri veritabanından çeker
    private func loadShortLinks() {
        container = try? ModelContainer(for: ShortLink.self)
        
        let descriptor = FetchDescriptor<ShortLink>()
        let links = (try? container?.mainContext.fetch(descriptor)) ?? []
        
        shortLinks = links
        tableView.reloadData()
        
    }
    
}

extension HistoryVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shortLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShortLinkCell", for: indexPath) as? ShortLinkCell else {
            return UITableViewCell()
        }
        
        let shortLink = shortLinks[indexPath.row]
        cell.shortURL.text = shortLink.shortURL
        cell.longURL.text = shortLink.longURL
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
