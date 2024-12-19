//
//  HistoryVC.swift
//  Shortly
//
//  Created by Nevin Özkan on 18.12.2024.
//

import UIKit
import SwiftData

class HistoryVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
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
            
            title = "Short Links"
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Sample Links", style: .plain, target: self, action: #selector(addSampleLinks))
        }
        
        private func loadShortLinks() {
            container = try? ModelContainer(for: ShortLink.self)
            
            let descriptor = FetchDescriptor<ShortLink>()
            let links = (try? container?.mainContext.fetch(descriptor)) ?? []
            
            shortLinks = links
            tableView.reloadData()
        }
        
        @objc private func addSampleLinks() {
            let sampleLinks = [
                ShortLink(shortURL: "short.ly/abc123", longURL: "https://www.example.com/some-long-url"),
                ShortLink(shortURL: "short.ly/xyz456", longURL: "https://www.anotherexample.com/another-long-url")
            ]
            
            let context = container?.mainContext
            for link in sampleLinks {
                try? context?.insert(link)
            }
            
            try? context?.save()
            loadShortLinks()
        }
    }

    extension HistoryVC: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shortLinks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShortLinkCell", for: indexPath)
            
            let shortLink = shortLinks[indexPath.row]
            cell.textLabel?.text = "\(shortLink.shortURL)\n\(shortLink.longURL)"
            cell.textLabel?.numberOfLines = 0
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
    }
