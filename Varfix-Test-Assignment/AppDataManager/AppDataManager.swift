//
//  AppDataManager.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/9/21.
//

import Foundation

final class AppDataManager: NSObject {
    
    private override init() {
        super.init()
    }
    
    private static let _shared: AppDataManager = {
        return AppDataManager()
    }()
    
    static var shared: AppDataManager {
        let lock = DispatchQueue(label: "AppDataManager")
        return lock.sync { return _shared }
    }
    
    lazy var garments = [Garment]()
    
    func loadData() {
        self.garments = loadGarments()
    }
    
    private let garmentFile = "Garments.json"
    
    func findFilePath(forResource path:String) -> String? {
        guard let documentsDirectory = try? FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else { return nil}
        let folderPath = documentsDirectory.appendingPathComponent(path).path
        return folderPath
    }
    
    func addNewGarment(_ garment: Garment) {
        self.garments.append(garment)
        guard let filePath = findFilePath(forResource: garmentFile) else { return }
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try JSONSerialization.data(withJSONObject: self.garments.map({$0.convertToDictionary()}), options: [])
            try data.write(to: url)
        } catch {
            print("❌ failed to save Garments data: \(error.localizedDescription)")
        }
    }
    
    private func loadGarments() -> [Garment] {
        var loadedGarments = [Garment]()
        guard let filePath = findFilePath(forResource: garmentFile) else { return loadedGarments }
        let url = URL.init(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url, options: [])
            guard let array = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] else { return loadedGarments }
            loadedGarments = Garment.transformJsonToArray(data: array)
            return loadedGarments
        } catch {
            print("❌ failed to load slabs data: \(error.localizedDescription)")
            return loadedGarments
        }
    }
}
