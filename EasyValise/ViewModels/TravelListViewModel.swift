//
//  TravelListViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 03/06/2023.
//

import Foundation

final class TravelListViewModel {
 
    let easyValiseRepository: EasyValiseRepository
    let travel: Travel
    var sectionsName: [String] {
        var sectionsUsed: Set<String> = []
        for item in travel.suitcase.items {
            sectionsUsed.insert(item.section)
        }
        return Array(sectionsUsed).sorted { $0 < $1 }
    }
    
    init(travel: Travel, easyValiseRepository: EasyValiseRepository = EasyValiseRepository()){
        self.travel = travel
        self.easyValiseRepository = easyValiseRepository
    }
    
    func updateIsChecked(for travel: Travel, item: Item, isChecked: Bool, callback: @escaping (Bool) -> Void) {
        easyValiseRepository.updateIsChecked(for: travel, item: item, isChecked: isChecked) { [] success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }
    
    func getItem(indexpathSection:Int, indexpathRow:Int) -> Item {
        let section = self.sectionsName[indexpathSection]
        let itemsInSection = self.travel.suitcase.items.filter { $0.section == section }
        let itemsInSectionOrdered = itemsInSection.sorted { $0.name < $1.name }
        return itemsInSectionOrdered[indexpathRow]
    }
}
