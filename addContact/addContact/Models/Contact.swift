//
//  Contact.swift
//  addContact
//
//  Created by Роман Козловский on 28.04.2023.
//

import Foundation

struct Contact: Codable {
    let firstName: String
    let lastName: String
    
    var description: String {
        "\(firstName) \(lastName)"
    }
}
