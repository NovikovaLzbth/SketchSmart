//
//  TestModel.swift
//  SketchSmart
//
//  Created by Елизавета on 22.05.2025.
//

import SwiftUI
import CoreData

final class TestModel: ObservableObject {
    
    @Published var isSelected1: Bool = false
    @Published var isSelected2: Bool = false
    @Published var selectedAnswer1: String = ""
    @Published var selectedAnswer2: String = ""
    @Published var correctAnswersCount: Int = 0
    @Published var wrongAnswersCount: Int = 0
    
    private let correctAnswers = [
        "color_group_test": "Первичные",
        "color_scheme_test": "Сплит-комплиментарный"
    ]
    
    let storage: Storage
    let testID1 = "color_group_test"
    let testID2 = "color_scheme_test"
    
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
                updateCounters(testID: testID, answer: answer)
            } else if testID == testID2 {
                isSelected2 = true
                selectedAnswer2 = answer
                updateCounters(testID: testID, answer: answer)
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
            resetCounters()
        } catch {
            print("Error deleting test result: \(error)")
        }
    }
    
    func updateCounters(testID: String, answer: String) {
        if let correctAnswer = correctAnswers[testID] {
            if answer == correctAnswer {
                correctAnswersCount += 1
            } else {
                wrongAnswersCount += 1
            }
        }
    }
    
    func resetCounters() {
            correctAnswersCount = 0
            wrongAnswersCount = 0
        }
}
