//
//  TravelViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 22/05/2023.
//

import Foundation

final class TravelViewModel {
    let easyValiseRepository = EasyValiseRepository()
    
    
    func getTravels(callback: @escaping (Bool, [Travel]) -> Void) {
        easyValiseRepository.getAllTravel { [] success, travels in
            if success {
                callback(true, travels)
            } else {
                callback(false, [])
            }
        }
    }
}
