//
//  SuitcaseItemData.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import Foundation
import CoreData

final class SuitcaseItemData: NSManagedObject {
    
    convenience init?(context: NSManagedObjectContextProtocol) {
        if let context = context as? NSManagedObjectContext {
            self.init(context: context)
        } else {
            return nil
        }
    }
}

extension SuitcaseItemData {
    func toItem() -> Item {
        Item(name: self.name ?? "", isChecked: self.isChecked, section: self.section ?? "")
    }
}
