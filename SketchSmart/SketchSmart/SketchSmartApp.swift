//
//  SketchSmartApp.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI

@main
struct SketchSmartApp: App {
    let persistenceController = PersistenceController.shared
    private let storage = Storage(persistenceController: PersistenceController.shared)

    var body: some Scene {
        WindowGroup {
            Launch()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(storage)
        }
    }
}
