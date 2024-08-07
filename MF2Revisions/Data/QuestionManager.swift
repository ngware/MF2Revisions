//
//  QuestionManager.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 31/07/2024.
//

import UIKit
import CoreData

class QuestionManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "CoreData") // Remplacez "YourModelName" par le nom de votre modèle de données
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
    
    func fetchQuestions() -> [QuestionEntity]? {
        let fetchRequest: NSFetchRequest<QuestionEntity> = QuestionEntity.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch questions: \(error)")
            return nil
        }
    }
    
    func selectRandomQuestion() -> QuestionEntity? {
        guard let questions = fetchQuestions(), !questions.isEmpty else {
            print("No questions available")
            return nil
        }
        
        let randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
        let selectedQuestion = questions[randomIndex]
        
        // Increment the view count
        selectedQuestion.viewCount += 1
        
        // Save the context
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
        
        return selectedQuestion
    }
    
    func saveQuestion(data: [String: Any]) {
        let context = persistentContainer.viewContext
        let questionEntity = QuestionEntity(context: context)
        questionEntity.field = data["Field"] as? String
        questionEntity.theme = data["Theme"] as? String
        questionEntity.date = data["Date"] as? Date
        questionEntity.city = data["City"] as? String
        questionEntity.points = data["Points"] as? Int32 ?? 0
        questionEntity.question = data["Question"] as? String
        questionEntity.answer = data["Answer"] as? String
        questionEntity.viewCount = 0

        do {
            try context.save()
        } catch {
            print("Failed to save question: \(error)")
        }
    }
    
    func deleteAllRecords(entityName: String) {
        
        // Get the Managed Object Context
        let managedContext = persistentContainer.viewContext
        
        // Create a fetch request for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.includesPropertyValues = false // Optional: Skip loading property values to save memory
        
        do {
            // Fetch all objects of the entity
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            // Delete each object
            for item in items {
                managedContext.delete(item)
            }
            
            // Save the context
            try managedContext.save()
            
            print("Successfully deleted all records from \(entityName).")
        } catch let error as NSError {
            print("Failed to delete all records from \(entityName): \(error), \(error.userInfo)")
        }
    }
}

//let questionManager = QuestionManager()
//
//if let question = questionManager.selectRandomQuestion() {
//    print("Question: \(question.question ?? "Unknown question")")
//    print("Answer: \(question.answer ?? "Unknown answer")")
//    print("View count: \(question.viewCount)")
//} else {
//    print("No question available")
//}

