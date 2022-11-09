//
//  AppDIContainer.swift
//  Demo
//
//  Created by Venkatesh Badya on 28/10/22.
//

import Foundation
import UIKit

class AppDIContainer {
    
    var networkManager: NetworkManagerModel = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func load(on window: UIWindow?) {
        let module = UserModule(networkManager: networkManager)
        if let viewController = module.generateViewController() {
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
    
}

