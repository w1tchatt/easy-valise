//
//  CreateTravelViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 10/06/2023.
//

import Foundation

final class CreateTravelViewModel {
    var travelDate: Date = .now
    
    func getDate(date:Date) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        
        if let year = components.year, let month = components.month, let day = components.day {
            let myDateComponents = DateComponents(year: year, month: month, day: day)
            if let myDate = calendar.date(from: myDateComponents) {
                self.travelDate = myDate
            }
        }
    }
    
    func textFieldIsEmpty(text: String?) -> Bool {
        guard let textUnwrap = text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return true }
            if textUnwrap.isEmpty {
                return true
            } else {
            return false
        }
    }
}
