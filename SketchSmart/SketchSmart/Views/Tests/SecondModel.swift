//
//  SecondModel.swift
//  SketchSmart
//
//  Created by Елизавета on 29.05.2025.
//

import SwiftUI
import CoreData

final class SecondModel: ObservableObject {
    
    @Published var isSelected1: Bool = false
    @Published var isSelected2: Bool = false
    @Published var isSelected3: Bool = false
    @Published var isSelected4: Bool = false
    
    @Published var selectedAnswer1: String = ""
    @Published var selectedAnswer2: String = ""
    @Published var selectedAnswer3: String = ""
    @Published var selectedAnswer4: String = ""
    
    @Published var correctAnswersCount: Int = 0
    @Published var wrongAnswersCount: Int = 0
    
    let correctAnswers = [
        "color_group_test": "Пикселей",
        "color_scheme_test": "Пространственного разрешения",
        "color_palette_test": "Примитивов (фигур)",
        "color_theory_test": "Графический редактор"
    ]
    
    let storage: Storage
    let testID1 = "color_group_test"
    let testID2 = "color_scheme_test"
    let testID3 = "color_palette_test"
    let testID4 = "color_theory_test"
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    private var viewContext: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
    
    func saveTestResult(answer: String, testID: String) {
        deleteExistingResult(for: testID)
        
        let newResult = TestResult(context: viewContext)
        newResult.testID = testID
        newResult.answer = answer
        newResult.timestamp = Date()
        
        do {
            try viewContext.save()
            
            if testID == testID1 {
                isSelected1 = true
                selectedAnswer1 = answer
            } else if testID == testID2 {
                isSelected2 = true
                selectedAnswer2 = answer
            } else if testID == testID3 {
                isSelected3 = true
                selectedAnswer3 = answer
            } else if testID == testID4 {
                isSelected4 = true
                selectedAnswer4 = answer
            }
            
            if let correctAnswer = correctAnswers[testID] {
                if answer == correctAnswer {
                    correctAnswersCount += 1
                } else {
                    wrongAnswersCount += 1
                }
            }
        } catch {
            print("Error saving test result: \(error)")
        }
    }
    
    func deleteExistingResult(for testID: String) {
        let request = NSFetchRequest<TestResult>(entityName: "TestResult")
        request.predicate = NSPredicate(format: "testID == %@", testID)
        
        do {
            let results = try viewContext.fetch(request)
            for object in results {
                viewContext.delete(object)
            }
        } catch {
            print("Error deleting test result: \(error)")
        }
    }
}
