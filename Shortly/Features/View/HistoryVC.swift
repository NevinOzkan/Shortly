//
//  HistoryVC.swift
//  Shortly
//
//  Created by Nevin Özkan on 17.12.2024.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
        var viewModel: LinkListViewModel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            
            viewModel.onLinksUpdated = { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            
            if viewModel.links.isEmpty {
                tableView.reloadData()
            }
        }
        
        private func setupUI() {
            let nib = UINib(nibName: "ShortLinkCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "ShortLinkCell")
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    extension HistoryVC: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.links.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShortLinkCell", for: indexPath) as? ShortLinkCell else {
                return UITableViewCell()
            }
            
            let link = viewModel.links[indexPath.row]
            print(link)
            
            cell.longURL.text = link.destination
            cell.shortURL.text = link.shortUrl
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
    }
