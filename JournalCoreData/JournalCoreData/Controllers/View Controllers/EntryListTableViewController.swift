//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Ethan Andersen on 4/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    
    // MARK: - Lifecycle
    
    // Loads the first time
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.sharedInstance.fetchEntry()
    }
    
    // Checks after coming back from the Detail View
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entries.count
    }

    // Content for each Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController else { return }
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            destination.entry = entry
        }
    }
    
} // End of Class
