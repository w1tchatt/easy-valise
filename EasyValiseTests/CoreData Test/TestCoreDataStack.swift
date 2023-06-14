//
//  TestCoreDataStack.swift
//  EasyValiseTests
//
//  Created by Richard Sourianarayanane on 11/06/2023.
//

import Foundation
import CoreData
@testable import EasyValise

class TestCoreDataStack: CoreDataStack {

    private lazy var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name: "EasyValise")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    override var viewContext: NSManagedObjectContextProtocol {
        return persistentContainer.viewContext
    }

}

class TestCoreDataStackKO: CoreDataStack {

    lazy var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name: "EasyValise")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    override var viewContext: NSManagedObjectContextProtocol {
        return NSManagedObjectContextFake(shouldThrowFetch: true, shouldThrowSave: true, shouldThrowDelete: true)
    }

}

enum DummyError: Error {
    case fake
}

class NSManagedObjectContextFake: NSManagedObjectContextProtocol {

    init(shouldThrowFetch: Bool, shouldThrowSave: Bool, shouldThrowDelete: Bool) {
        self.shouldThrowFetch = shouldThrowFetch
        self.shouldThrowSave = shouldThrowSave
        self.shouldThrowDelete = shouldThrowDelete
    }

    let shouldThrowFetch: Bool
    let shouldThrowSave: Bool
    let shouldThrowDelete: Bool

    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] where T: NSFetchRequestResult {
        if shouldThrowFetch {
            throw DummyError.fake
        }
        return .init()
    }

    func save() throws {
        if shouldThrowSave {
            throw DummyError.fake
        }
    }

    func delete(_ object: NSManagedObject) throws {
        if shouldThrowDelete {
            throw DummyError.fake
        }
    }

}

