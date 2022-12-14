//
//  UserListVC+DataSource.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import UIKit

//MARK: UITableView Delegate and DataSource

extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("user_cell", comment: ""), for: indexPath) as? UserListTableViewCell else {
            fatalError()
        }
        
        cell.userCellModel = viewModel?.users?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.output?.handleNavigation(indexPath.row)
    }
}
