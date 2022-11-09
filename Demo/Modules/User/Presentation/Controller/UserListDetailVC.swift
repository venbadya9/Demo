//
//  UserListDetailVC.swift
//  Demo
//
//  Created by Venkatesh Badya on 09/11/22.
//

import UIKit
import WebKit

class UserDetailVC: UIViewController {

    // MARK: IBOutlets

    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var name: UILabel!
    
    // MARK: Variables
    
    var viewModel: UserDetailViewModel?
        
    // MARK: Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchDetails()
    }
}

extension UserDetailVC: CallbackStatus {
    
    func handleSuccess(_ url: URL?) {
        if let loadUrl = url {
            let urlReq = URLRequest(url: loadUrl)
            
            if let user = viewModel?.userModel?.data[viewModel?.index ?? 0] {
                let name = user.firstName + " " + user.lastName
                
                DispatchQueue.main.async {
                    self.name.text = name
                    self.webView.load(urlReq)
                }
            }
        }
    }
    
    func handleFailure(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("alert", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
