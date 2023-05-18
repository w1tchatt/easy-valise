//
//  Travel2.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 29/04/2023.
//

import Foundation

class Travel: Codable {
    var name: String
    var date: Date
    
    var suicase: Suitcase
    
    init(name: String, date: Date, suitcase: Suitcase) {
        self.name = name
        self.date = date
        self.suicase = suitcase
    }
}
