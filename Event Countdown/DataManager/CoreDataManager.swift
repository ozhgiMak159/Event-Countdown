//
//  CoreDataManager.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Event_Countdown")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
     var moc: NSManagedObjectContext {
            persistentContainer.viewContext
    }
    
    func get<T: NSManagedObject>(_ id: NSManagedObjectID) -> T? {
        do {
            return try moc.existingObject(with: id) as? T
        } catch {
            print(error)
        }
        return nil
    }
    
    func getAll<T: NSManagedObject>() -> [T] {
        do {
            let fetchRequest = NSFetchRequest<T>(entityName: "\(T.self)")
            return try moc.fetch(fetchRequest)
        } catch {
            print(error)
            return []
        }
    }
    
    func save() {
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
}

