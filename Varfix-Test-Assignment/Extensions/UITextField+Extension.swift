//
//  UITextField+Extension.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/7/21.
//

import UIKit

extension UITextField {
    class func connectFields(fields: [UITextField]) {
        guard let last = fields.last else { return }
        for i in 0 ..< fields.count - 1 {
            fields[i].returnKeyType = .next
            fields[i].addTarget(fields[i + 1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
}
