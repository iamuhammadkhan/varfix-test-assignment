//
//  GarmentListViewModel.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/7/21.
//

import Foundation

protocol GarmentListProtocol: NSObject {
    func garmentListUpdated()
}

class GarmentListViewModel: NSObject {
    
    weak var delegate: GarmentListProtocol?
    private lazy var garments = [Garment]()
    
    func addNewGarment(with garment: Garment) {
        garments.append(garment)
        delegate?.garmentListUpdated()
    }
    
    func getGarments() -> [Garment] {
        return garments
    }
    
    func getGarment(at index: Int) -> Garment? {
        if garments.isEmpty {
            return nil
        }
        return garments[index]
    }
    
    private func sortListAlphabetically() {
        if garments.count < 2 { return }
        garments = garments.sorted(by: { $0.garmentName.lowercased() < $1.garmentName.lowercased() } )
    }
    
    private func sortListDateWise() {
        if garments.count < 2 { return }
        garments = garments.sorted(by: { $0.createdAt < $1.createdAt } )
    }
    
    func sortGarments(with index: Int) {
        index == 1 ? sortListAlphabetically() : sortListDateWise()
        delegate?.garmentListUpdated()
    }
}
