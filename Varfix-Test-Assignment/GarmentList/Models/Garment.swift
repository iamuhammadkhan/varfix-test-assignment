//
//  Garment.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/7/21.
//

import Foundation

struct Garment {
    let createdAt: Date
    let garmentName: String
    
    func convertToDictionary() -> [String: Any] {
        let dateString = "\(createdAt)"
        return [ "createdAt": dateString,
                 "garmentName": garmentName ]
    }
    
    static func transformJsonToArray(data: [[String: Any]]) -> [Garment] {
        var garments = [Garment]()
        data.forEach { (item) in
            let createdAt = item["createdAt"] as? String ?? ""
            let garmentName = item["garmentName"] as? String ?? ""
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formatter.date(from: createdAt) ?? Date()
            let garment = Garment(createdAt: date, garmentName: garmentName)
            garments.append(garment)
        }
        return garments
    }
}
