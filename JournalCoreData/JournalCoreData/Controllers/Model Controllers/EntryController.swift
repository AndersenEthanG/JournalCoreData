//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Ethan Andersen on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: - Properties
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    // Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // Initializer
    private init() {}
    
    
    //MARK: - Functions
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, bodyText: body)
        entries.append(entry)
    
        CoreDataStack.saveContext()
    }
    
    func fetchEntry() {
        // Define what we want to fetch
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodyText = body
        entry.timeStamp = Date()
        CoreDataStack.saveContext()
    }
}
