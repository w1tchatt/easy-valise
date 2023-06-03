//
//  Suitcase.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 25/04/2023.
//

import Foundation

class Suitcase: Codable {
    var items: [Item]
    
    init(items:[Item]) {
        self.items = items
    }
}
