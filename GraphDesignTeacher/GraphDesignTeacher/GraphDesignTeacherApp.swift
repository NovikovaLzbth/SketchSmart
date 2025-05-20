//
//  GraphDesignTeacherApp.swift
//  GraphDesignTeacher
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI

@main
struct GraphDesignTeacherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
