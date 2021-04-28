//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Ethan Andersen on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Properties
    var entry: Entry?
    
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    
    // MARK: - Actions
    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        // Check if the entry title is blank
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
    
        // Check if the entry already has a value, to know if we should call the update or the create function
        if let entry = entry {
            EntryController.sharedInstance.updateEntry(entry: entry, title: title, body: body)
        } else {
            EntryController.sharedInstance.createEntry(title: title, body: body)
        }
        // Pop back to the View controller
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Functions
    func updateView() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
    
} // End of Class
