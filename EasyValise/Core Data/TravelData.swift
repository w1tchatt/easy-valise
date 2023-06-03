//
//  TravelData.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 29/05/2023.
//

import Foundation
import CoreData

final class TravelData: NSManagedObject {
    
    convenience init?(context: NSManagedObjectContextProtocol) {
        if let context = context as? NSManagedObjectContext {
            self.init(context: context)
        } else {
            return nil
        }
    }
}

extension TravelData {
    func toTravel() -> Travel? {
       guard let name = self.name,
          let date = self.date,
          let suitcaseData = self.suitcase else {
           return nil
       }
        guard let suitcase = suitcaseData.toSuitcase() else { return nil }
        return Travel(name: name, date: date, suitcase: suitcase)
    }
}

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
        guard let itemsSet = self.items as? Set<SuitcaseItem> else { return nil}
        let itemsArray = Array(itemsSet)
        let items = itemsArray.compactMap { $0.toItem() }
        return Suitcase(items: items)
    }
}


final class SuitcaseItem: NSManagedObject {
    
    convenience init?(context: NSManagedObjectContextProtocol) {
        if let context = context as? NSManagedObjectContext {
            self.init(context: context)
        } else {
            return nil
        }
    }
}

extension SuitcaseItem {
    func toItem() -> Item {
        Item(name: self.name ?? "", isChecked: self.isChecked, section: self.section ?? "")
    }
}
