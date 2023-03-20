//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 20.03.2023.
//

import SwiftUI

@main
struct TestProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
