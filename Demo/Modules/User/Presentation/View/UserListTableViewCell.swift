//
//  UserListTableViewCell.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var bgView: UIView!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    // MARK: Variables
    
    // Using UserCellViewModel for configuring cell
    var userCellModel : UserCellViewModel? {
        didSet {
            if let imageUrl = URL(string: userCellModel?.avatar ?? "") {
                userImageView.load(url: imageUrl)
            }
            nameLabel.text = userCellModel?.fullName
            emailLabel.text = userCellModel?.email
        }
    }
    
    // MARK: Object Lifecycle
    
    override func awakeFromNib() {
        self.bgView.addBorder()
    }
}
