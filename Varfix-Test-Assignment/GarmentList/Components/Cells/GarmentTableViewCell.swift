//
//  GarmentTableViewCell.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/7/21.
//

import UIKit

class GarmentTableViewCell: UITableViewCell {

    @IBOutlet weak var garmentNameLabel: UILabel!
    
    func configure(with garment: Garment?) {
        garmentNameLabel.text = garment?.garmentName ?? ""
    }
}
