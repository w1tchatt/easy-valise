//
//  EasyValiseRepository.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 01/06/2023.
//

import Foundation
import CoreData

final class EasyValiseRepository {
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }
    
    func save(travel: Travel, callback: @escaping (Bool) -> Void) {
        do {
            guard let travelData = TravelData(context: coreDataStack.viewContext) else { return }
            travelData.name = travel.name
            travelData.date = travel.date
            travelData.id = travel.id
            
            guard let suitcaseData = SuitcaseData(context: coreDataStack.viewContext) else { return }
            travelData.suitcase = suitcaseData
            
            for item in travel.suitcase.items {
                guard let suitcaseItem = SuitcaseItem(context: coreDataStack.viewContext) else {return}
                suitcaseItem.name = item.name
                suitcaseItem.isChecked = item.isChecked
                suitcaseItem.section = item.section
                
                suitcaseData.addToItems(suitcaseItem)
            }
            try coreDataStack.viewContext.save()
            print(travelData)
            print(suitcaseData)
            callback(true)
        } catch {
            callback(false)
        }
    }
    
    func getAllTravel(callback: @escaping (Bool, [Travel]) -> Void) {
        let request: NSFetchRequest<TravelData> = TravelData.fetchRequest()
        
        do {
            let travelData = try coreDataStack.viewContext.fetch(request)
            var travels: [Travel] = []
            for travel in travelData {
                if let travelUnwrap = travel.toTravel() {
                    travels.append(travelUnwrap)
                }
            }
            callback(true, travels)
        } catch {
            callback(false, [])
        }
    }
    
    func updateIsChecked(for travel: Travel, item:Item, isChecked: Bool, callback: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<TravelData> = TravelData.fetchRequest()
        do {
            request.predicate = NSPredicate(format: "id == %@", travel.id as CVarArg)
            let travelData = try coreDataStack.viewContext.fetch(request).first
            let suitcaseData = travelData?.suitcase
            let items = suitcaseData?.items?.allObjects as? [SuitcaseItem]
            let selectedItem = items?.first(where: { $0.name == item.name })

            selectedItem?.isChecked = isChecked

            try coreDataStack.viewContext.save()
            callback(true)

        } catch {
            callback(false)
        }
        
    }
}
