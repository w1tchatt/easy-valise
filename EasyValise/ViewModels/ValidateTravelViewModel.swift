//
//  ValidateTravelViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 03/06/2023.
//

import Foundation

final class ValidateTravelViewModel {
    let easyValiseRepository = EasyValiseRepository()
    
    func saveInCoreData(travel: Travel, callback: @escaping (Bool) -> Void) {
        easyValiseRepository.save(travel: travel) { [] success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }
}
