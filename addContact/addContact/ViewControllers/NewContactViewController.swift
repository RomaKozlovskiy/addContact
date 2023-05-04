//
//  NewContactViewController.swift
//  addContact
//
//  Created by Роман Козловский on 28.04.2023.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(_ contact: Contact)
}

class NewContactViewController: UIViewController {

    // MARK: - @IBOutlets
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var doneButton: UIBarButtonItem!
    
    // MARK: - Public Properties
    var delegate: NewContactViewControllerDelegate!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.isEnabled = false
        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )
    }
    // MARK: - @IBActions
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        saveAndExit()
    }
    
    // MARK: - Private Methods
    @objc private func firstNameTextFieldDidChanged() {
        if let text = firstNameTextField.text {
            doneButton.isEnabled = !text.isEmpty ? true : false
        }
    }
    
    private func saveAndExit() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let contact = Contact(firstName: firstName, lastName: lastName)
        StorageManager.shared.save(contact: contact)
        
        delegate.saveContact(contact)
        dismiss(animated: true)
    }
}

