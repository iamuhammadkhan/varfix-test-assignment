//
//  UIViewController+Extension.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/7/21.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
