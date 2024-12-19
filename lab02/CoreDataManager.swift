//
//  CoreDataManager.swift
//  lab02
//
//  Created by Lucely Mendoza on 3/10/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // Singleton instance
    static let shared = CoreDataManager()
    
    // Persistent Container
    let persistentContainer: NSPersistentContainer
    
    // Initializer (private to enforce singleton usage)
    private init() {
        persistentContainer = NSPersistentContainer(name: "UserModel") // Asegúrate de usar el nombre correcto de tu modelo .xcdatamodeld
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading persistent stores: \(error)")
            }
        }
    }
    
    // Save user data to Core Data
    func saveUser(firstName: String, lastName: String, email: String, username: String, password: String) {
        let context = persistentContainer.viewContext
        let newUser = User(context: context) // 'User' es la entidad definida en tu modelo Core Data
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.username = username
        newUser.password = password
        
        do {
            try context.save()
            print("User saved successfully!")
        } catch {
            print("Failed to save user: \(error)")
        }
    }
    
    // Fetch a user based on username and password
    func fetchUser(username: String, password: String) -> User? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            print("Failed to fetch user: \(error)")
            return nil
        }
    }
    
    // Update user information (if needed)
    func updateUser(user: User, newFirstName: String, newLastName: String, newEmail: String) {
        let context = persistentContainer.viewContext
        user.firstName = newFirstName
        user.lastName = newLastName
        user.email = newEmail
        
        do {
            try context.save()
            print("User updated successfully!")
        } catch {
            print("Failed to update user: \(error)")
        }
    }
    
    // Delete a user (if needed)
    func deleteUser(user: User) {
        let context = persistentContainer.viewContext
        context.delete(user)
        
        do {
            try context.save()
            print("User deleted successfully!")
        } catch {
            print("Failed to delete user: \(error)")
        }
    }
}
