//
//  CoreDataManager.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 24.03.2023.
//

import CoreData
import SwiftUI

class CoreDataManager {
    @StateObject var loginModel: LoginViewModel = .init()
    @Environment(\.managedObjectContext) var viewContext
    static let shared = CoreDataManager()
    
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "TestProject")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    func createUser(firstName: String,lastName: String,email: String, password: String) -> Bool{
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)!
        let user = NSManagedObject(entity: entity, insertInto: context)
        user.setValue(loginModel.email, forKeyPath: "email")
        user.setValue(loginModel.pass, forKeyPath: "password")
        user.setValue(loginModel.firstName, forKeyPath: "firstName")
        user.setValue(loginModel.lastName, forKeyPath: "lastName")
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
    
    func validateUser(email: String, password: String) -> Bool {
        let request = NSFetchRequest<Users>(entityName: "Users")
        do {
            let users = try persistentContainer.viewContext.fetch(request)
                return users.count > 0
        } catch {
            print("Failed to fetch users: \(error)")
            return false
        }
    }
}
