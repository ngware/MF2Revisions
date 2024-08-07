//
//  CoreDataStack.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 31/07/2024.
//

import CoreData
import UIKit

class CoreDataStack {
    static let shared = CoreDataStack()

    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData") // Replace "YourModelName" with the name of your data model
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}

extension CoreDataStack {
    convenience init(inMemory: Bool = false) {
        self.init()
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            self.persistentContainer.persistentStoreDescriptions = [description]
        }
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
}
