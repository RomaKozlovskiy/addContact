//
//  NewContactViewController.swift
//  addContact
//
//  Created by Роман Козловский on 28.04.2023.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        firstNameTextField.addTarget(self, action: #selector(firstNameTextFieldDidChanged), for: .editingChanged)
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
    }
    
    // MARK: - Private Methods
    @objc private func firstNameTextFieldDidChanged() {
        if let text = firstNameTextField.text {
            doneButton.isEnabled = !text.isEmpty ? true : false
        }
    }
}

