//
//  CoreDataTests.swift
//  MF2RevisionsTests
//
//  Created by Nicolas Guyot on 31/07/2024.
//
import XCTest
import CoreData
@testable import MF2Revisions

class CoreDataTests: XCTestCase {

    var coreDataStack: CoreDataStack!
    var questionManager: QuestionManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        coreDataStack = CoreDataStack(inMemory: true)
        questionManager = QuestionManager()
    }

    override func tearDownWithError() throws {
        coreDataStack = nil
        questionManager = nil
        try super.tearDownWithError()
    }

//    func testSaveQuestion() throws {
//        // Given
//        let questionData: [String: Any] = [
//            "field": "Physics",
//            "theme": "Mechanics",
//            "date": Date(),
//            "city": "New York",
//            "points": 10,
//            "question": "What is Newton's second law?",
//            "answer": "F = ma"
//        ]
//
//        // When
//        questionManager.saveQuestion(data: questionData)
//
//        // Then
//        let fetchRequest: NSFetchRequest<QuestionEntity> = QuestionEntity.fetchRequest()
//        let results = try coreDataStack.context.fetch(fetchRequest)
//        print(results.first)
////        XCTAssertEqual(results.count, 1)
//        XCTAssertEqual(results.first?.field, "Physics")
//        XCTAssertEqual(results.first?.theme, "Mechanics")
//        XCTAssertEqual(results.first?.points, 10)
//        XCTAssertEqual(results.first?.question, "What is Newton's second law?")
//        XCTAssertEqual(results.first?.answer, "F = ma")
//    }
}
