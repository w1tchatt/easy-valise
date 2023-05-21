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

//class Item: NSManagedObject {
//
//    @NSManaged var id: UUID
//
//    @NSManaged var name: String
//
//    @NSManaged var isChecked: Bool
//
//    @NSManaged private var sectionRawValue: String
//
//    var section: Section {
//        get { return Section(rawValue: self.sectionRawValue)! }
//        set { self.sectionRawValue = newValue.rawValue }
//    }
//
//}
//
//
//travel: {
//    suitcase: {
//        section: [
//            {
//                items: [
//                    {
//                    id: 1,
//                    name: "Slip"
//                    isChecked: true
//                    section: {
//
//                    }
//
//                    },
//                    {
//                    id: 2,
//                    name: "Chaussettes"
//                    isChecked: true
//                    section: {
//
//                    }
//
//                    }
//                ]
//            },
//            section: [
//                {
//                    items: [
//                        {
//                        id: 1,
//                        name: "Slip"
//                        isChecked: true
//                        section: {
//
//                        }
//
//                        },
//                        {
//                        id: 2,
//                        name: "Chaussettes"
//                        isChecked: true
//                        section: {
//
//                        }
//
//                        }
//                    ]
//                },
//        ]
//    }
//}
//
//
//travel: {
//    suitcase: {
//        allItems: [
//            {
//                id: 1,
//                name: "Slip"
//                isChecked: true
//                section: {
//
//                }
//
//            },
//            {
//                id: 2,
//                name: "Chaussettes"
//                isChecked: true
//                section: {
//
//                }
//
//            }
//        ]
//    }
//}
