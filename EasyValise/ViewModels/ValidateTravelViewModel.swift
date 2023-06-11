//
//  ValidateTravelViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 03/06/2023.
//

import Foundation

final class ValidateTravelViewModel {
    let easyValiseRepository = EasyValiseRepository()
    var sectionsName:[String] = []
    
    var travelName: String
    var travelDate: Date
    var suitcaseModelName: String
    var items: [Item]
    
    init(travelName: String, travelDate: Date, suitcaseModelName: String, items: [Item]) {
        self.travelName = travelName
        self.travelDate = travelDate
        self.suitcaseModelName = suitcaseModelName
        self.items = items
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
    
    func defineSectionsToShow(items: [Item]) {
        var sectionsUsed: Set<String> = []
        for item in items {
            sectionsUsed.insert(item.section)
        }
        self.sectionsName = Array(sectionsUsed)
        self.sectionsName = sectionsName.sorted { $0 < $1 }
    }
}
