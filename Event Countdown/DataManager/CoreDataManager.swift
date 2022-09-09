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
    
    private var moc: NSManagedObjectContext {
            persistentContainer.viewContext
    }
    
//    init() {
//            viewContext = persistentContainer.viewContext
//    }
    
    // ??
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        //saveContext()
    }
    
    func fetchEvent() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
           print("error")
            return []
        }
    }
    
    
    
    
//    func fetchData(completion: (Result<[Event], Error>) -> Void) {
//        let fetchRequest = Event.fetchRequest()
//
//        do {
//            let events = try moc.fetch(fetchRequest)
//            completion(.success(events))
//        } catch {
//            completion(.failure(error))
//        }
//    }
    
    
    // Старый метод
//    func fetchEvents() -> [Event] {
//        do {
//            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
//            let events = try viewContext.fetch(fetchRequest)
//            return events
//        } catch {
//            print(error)
//            return []
//        }
//    }
    
//    func saveContext () {
//        if viewContext.hasChanges {
//            do {
//                try viewContext.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

    
    
}
