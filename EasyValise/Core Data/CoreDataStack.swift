//
//  CoreDataService.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 27/04/2023.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared: CoreDataStack = CoreDataStack()
    
   // private init() {}
    
    private let modelName: String = "EasyValise"
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var viewContext: NSManagedObjectContextProtocol {
        return CoreDataStack.shared.persistentContainer.viewContext
    }
}

protocol NSManagedObjectContextProtocol {
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] where T: NSFetchRequestResult

    func save() throws

    func delete(_ object: NSManagedObject) throws

}

extension NSManagedObjectContext: NSManagedObjectContextProtocol {

}
