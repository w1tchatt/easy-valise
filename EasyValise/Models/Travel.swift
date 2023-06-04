//
//  Travel2.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 29/04/2023.
//

import Foundation

class Travel: Codable {
    let id: UUID
    var name: String
    var date: Date
    
    var suitcase: Suitcase
    
    init(name: String, date: Date, suitcase: Suitcase, id: UUID = UUID() ) {
        self.name = name
        self.date = date
        self.suitcase = suitcase
        self.id = id
    }
}
