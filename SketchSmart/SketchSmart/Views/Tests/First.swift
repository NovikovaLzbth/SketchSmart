//
//  First.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

struct First: View {
    @StateObject private var viewModel: TestModel
    
    init(storage: Storage) {
        _viewModel = StateObject(wrappedValue: TestModel(storage: storage))
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
        }
    }
}

