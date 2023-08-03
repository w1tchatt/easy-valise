//
//  ValidateTravelViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 03/06/2023.
//

import Foundation

final class ValidateTravelViewModel {
    private let easyValiseRepository:EasyValiseRepository
    var sectionsName: [String] {
        var sectionsUsed: Set<String> = []
        for item in items {
            sectionsUsed.insert(item.section)
        }
        return Array(sectionsUsed).sorted { $0 < $1 }
    }
    
    var travelName: String
    var travelDate: Date
    var suitcaseModelName: String
    var items: [Item]
    
    init(travelName: String, travelDate: Date, suitcaseModelName: String, items: [Item], easyValiseRepository: EasyValiseRepository = EasyValiseRepository()) {
        self.travelName = travelName
        self.travelDate = travelDate
        self.suitcaseModelName = suitcaseModelName
        self.items = items
        self.easyValiseRepository = easyValiseRepository
    }
    
    
    func saveInCoreData(callback: @escaping (Bool) -> Void) {
        let newTravel = Travel(name: self.travelName, date: self.travelDate, suitcase: Suitcase(items: self.items))
        easyValiseRepository.save(travel: newTravel) { [] success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }
    
    func addNewItem(itemName: String, sectionName: Section.RawValue, callback: @escaping (Bool) -> Void) {
        let newItem = Item(name: itemName, isChecked: false, section: sectionName)
        self.items.append(newItem)
        callback(true)
    }
}
