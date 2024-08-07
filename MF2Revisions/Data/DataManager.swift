//
//  DataManager.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 07/08/2024.
//

import Foundation
import CoreData
import SwiftCSV

class DataManager: NSObject, ObservableObject {
    
    @Published var questions: [Question] = [Question]()
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "data")
    
    override init() {
        super.init()
//        container.loadPersistentStores {_, _ in }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }

            // Load CSV data
            let context = self.container.viewContext
            let fetchRequest: NSFetchRequest<Question> = Question.fetchRequest()
            do {
                let count = try context.count(for: fetchRequest)
                if count == 0 {
                    self.loadCSVAndSaveToCoreData(context: context)
                }
            } catch {
                print("Failed to fetch questions: \(error.localizedDescription)")
            }
        })
    }
    
    func loadCSVAndSaveToCoreData(context: NSManagedObjectContext) {

        do {
            let resource: CSV? = try CSV<Named>(
                name: "final_info_updated",
                extension: "csv",
                bundle: .main,
                delimiter: .character(";"),  // Any character works!
                encoding: .utf8)
            
//            let content = try String(contentsOfFile: filePath)
//            let rows = content.csvRows()
            guard resource?.rows.count ?? 0 > 1 else { return } // Ensure there is at least one question
            guard let resource = resource else { return }
            for (index, row) in resource.rows.enumerated() {
                if index == 0 { continue } // Skip the header row

                let question = Question(context: context)
                question.id = Int32(index)
                question.field = row["Field"]
                question.theme = row["Theme"]
                question.date = row["Date"]
                question.city = row["City"]
                question.points = row["Points"]
                question.question = row["Question"]
                question.answer = row["Answer"]
                question.viewCount = 0
            }

            try context.save()
        } catch {
            print("Failed to read CSV file: \(error.localizedDescription)")
        }
    }
}
