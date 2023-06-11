//
//  ChooseSuitcaseViewModel.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 08/06/2023.
//

import Foundation

final class ChooseSuicaseViewModel {
    let suitcaseCases: [SuitcasesModelsEnum] = SuitcasesModelsEnum.allCases
    var travelName: String
    var travelDate: Date
    
    init(travelName: String, travelDate: Date) {
        self.travelName = travelName
        self.travelDate = travelDate
    }
}
