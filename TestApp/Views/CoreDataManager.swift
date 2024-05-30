//
//  CoreDataManager.swift
//  TestApp
//
//  Created by Татьяна Касперович on 29.05.24.
//

import CoreData
import Foundation

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved successfuly!")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
        
    }
    
}
