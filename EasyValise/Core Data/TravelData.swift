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
             let suitcaseData = self.suitcase,
             let id = self.id else {
            return nil
       }
        guard let suitcase = suitcaseData.toSuitcase() else { return nil }
        return Travel(name: name, date: date, suitcase: suitcase, id: id)
    }
}
