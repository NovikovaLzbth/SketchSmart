//
//  ContentView.swift
//  GraphDesignTeacher
//
//  Created by Елизавета on 20.05.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {}
        
    }
}
    
#Preview {
    ContentView()
}
