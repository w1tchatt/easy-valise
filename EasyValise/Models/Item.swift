//
//  Item.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 25/04/2023.
//

import Foundation
import CoreData


class Item: Codable {
    
    var name: String
    var isChecked: Bool
    var section: Section.RawValue
    
    init(name: String, isChecked: Bool, section: Section.RawValue) {
        self.name = name
        self.isChecked = isChecked
        self.section = section
    }
}
