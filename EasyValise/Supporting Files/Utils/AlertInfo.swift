//
//  DisplayAlertInfo.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import UIKit

class AlertInfo {
    
    static func display(title: String, message: String, vc: UIViewController) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alertVC, animated: true, completion: nil)
    }
}
