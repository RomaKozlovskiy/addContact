//
//  StorageManager.swift
//  addContact
//
//  Created by Роман Козловский on 28.04.2023.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    private init() {}
    let userDefaults = UserDefaults.standard
    
    let contactsKey = "contacts"
    
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactsKey)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.object(forKey: contactsKey) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.setValue(data, forKey: contactsKey)
    }
    
}
