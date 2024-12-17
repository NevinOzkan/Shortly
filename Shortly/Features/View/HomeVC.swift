//
//  HomeVC.swift
//  Shortly
//
//  Created by Nevin Özkan on 16.12.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var shortenTextField: UITextField!
    @IBOutlet weak var shortenButton: UIButton!
    
    private var viewModel: LinkListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        let apiService = ApiService()

        viewModel = LinkListViewModel(apiService: apiService)
        
        viewModel.onLinksUpdated = { [weak self] in
            
        }
        
        viewModel.onError = { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.showAlert(message: errorMessage)
            }
        }
    }
    
    @IBAction func shortenButton(_ sender: Any) {
        guard let urlText = shortenTextField.text, !urlText.isEmpty else {
                   showAlert(message: "Lütfen bir URL girin!")
                   return
               }
               
               let title = "Kısa Link"
               
               viewModel.shortenLink(originalUrl: urlText, title: title) { [weak self] success in
                   if success {
                       self?.navigateToHistoryVC()
                   } else {
                       self?.showAlert(message: "Link kısaltılamadı.")
                   }
               }
           }
    private func navigateToHistoryVC() {
        let historyVC = HistoryVC(nibName: "HistoryVC", bundle: nil)
        historyVC.viewModel = self.viewModel
        
        if let navigationController = self.navigationController {
            print("Pushing HistoryVC to navigation controller")
            navigationController.pushViewController(historyVC, animated: true)
        } else {
            print("NavigationController not found, presenting modally")
            let navController = UINavigationController(rootViewController: historyVC)
            self.present(navController, animated: true, completion: nil)
        }
    }
       
       private func showAlert(message: String) {
           let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Tamam", style: .default))
           present(alert, animated: true)
       }
   }
