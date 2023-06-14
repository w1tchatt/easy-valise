//
//  CreateTravelViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 10/06/2023.
//

import Foundation

final class CreateTravelViewModel {
    var travelDate: Date = .now
    
    func setDate(date:Date) {
        self.travelDate = date
    }
    
    func textFieldIsEmpty(text: String?) -> Bool {
        guard let textUnwrap = text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return true }
        if textUnwrap.isEmpty {
            return true
        }
            return false
    }
}
