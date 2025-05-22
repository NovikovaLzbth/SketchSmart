//
//  TestModel.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

final class TestModel: ObservableObject {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
}
