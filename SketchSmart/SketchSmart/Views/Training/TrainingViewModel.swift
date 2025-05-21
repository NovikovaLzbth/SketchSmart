//
//  TrainingViewModel.swift
//  SketchSmart
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

final class TrainingViewModel: ObservableObject {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
}
