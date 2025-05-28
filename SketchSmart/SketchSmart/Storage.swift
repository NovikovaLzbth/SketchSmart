//
//  Storage.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

final class Storage: ObservableObject {
    
    private let persistenceController: PersistenceController
    private var context: NSManagedObjectContext {
        persistenceController.viewContext
    }
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    
}

