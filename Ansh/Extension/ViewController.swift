//
//  ViewController.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(message:String) {
        SVProgressHUD.showError(withStatus: message)
    }
}
