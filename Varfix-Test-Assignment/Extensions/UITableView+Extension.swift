//
//  UITableView+Extension.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/7/21.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError("Fatal error for reuseable cell at : \(indexPath)")
        }
        return cell
    }
}
