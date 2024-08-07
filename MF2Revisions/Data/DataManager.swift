//
//  DataManager.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 07/08/2024.
//

import Foundation
import CoreData

class DataManager: NSObject, ObservableObject {
    
    @Published var questions: [Question] = [Question]()
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "QuestionsList")
    
    override init() {
        super.init()
        container.loadPersistentStores {_, _ in }
    }
}
