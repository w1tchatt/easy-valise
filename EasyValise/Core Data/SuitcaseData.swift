//
//  SuitcaseData.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import Foundation
import CoreData

final class SuitcaseData: NSManagedObject {
    
    convenience init?(context: NSManagedObjectContextProtocol) {
        if let context = context as? NSManagedObjectContext {
            self.init(context: context)
        } else {
            return nil
        }
    }
}

extension SuitcaseData {
    func toSuitcase() -> Suitcase? {
        guard let itemsSet = self.items as? Set<SuitcaseItemData> else { return nil}
        let itemsArray = Array(itemsSet)
        let items = itemsArray.compactMap { $0.toItem() }
        return Suitcase(items: items)
    }
}
