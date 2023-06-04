//
//  TravelListViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 03/06/2023.
//

import Foundation

final class TravelListViewModel {
 
    let easyValiseRepository = EasyValiseRepository()
    
    func updateIdChecked(for travel: Travel, item: Item, isChecked: Bool, callback: @escaping (Bool) -> Void) {
        easyValiseRepository.updateIsChecked(for: travel, item: item, isChecked: isChecked) { [] success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }
    
}
