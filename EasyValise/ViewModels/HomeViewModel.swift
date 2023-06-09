//
//  HomeViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 22/05/2023.
//

import Foundation

final class HomeViewModel {
    private let easyValiseRepository: EasyValiseRepository
    var travels: [Travel] = []
    
    init(easyValiseRepository: EasyValiseRepository = EasyValiseRepository()) {
        self.easyValiseRepository = easyValiseRepository
    }
    
    func getTravels(callback: @escaping (Bool) -> Void) {
        easyValiseRepository.getAllTravel { [] success, travels in
            if success {
                self.travels = travels
                callback(true)
            } else {
                callback(false)
            }
        }
    }
    
    func deleteTravel(travel:Travel, callback: @escaping (Bool) -> Void) {
        easyValiseRepository.deleteTravel(for: travel) { success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }
    
    func dateFormatted(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
