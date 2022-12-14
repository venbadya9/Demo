//
//  ViewController.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import UIKit

class UserListVC: UIViewController {
    
    // MARK: IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Variables
    
    var viewModel: UserViewDataModel?
        
    // MARK: Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchDetails()
    }
}

extension UserListVC: CallbackStatus {
    
    func handleSuccess(_ url: URL?) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func handleFailure(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString("alert", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func handleNavigation(_ index: Int?) {
        let detailModule = UserDetailModule()
        if let userModel = self.viewModel?.userModel,
           let viewController = detailModule.generateDetailViewController(userModel, index ?? 0) as? UserDetailVC {
            self.navigationController?.pushViewController(viewController, animated: false)
        }
    }
}



