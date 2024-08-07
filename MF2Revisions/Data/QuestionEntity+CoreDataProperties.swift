//
//  QuestionEntity+CoreDataProperties.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 31/07/2024.
//
//

import Foundation
import CoreData


extension QuestionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionEntity> {
        return NSFetchRequest<QuestionEntity>(entityName: "QuestionEntity")
    }

    @NSManaged public var field: String?
    @NSManaged public var theme: String?
    @NSManaged public var date: Date?
    @NSManaged public var city: String?
    @NSManaged public var points: Int32
    @NSManaged public var question: String?
    @NSManaged public var answer: String?
    @NSManaged public var viewCount: Int32
    @NSManaged public var questionId: Int32

}

extension QuestionEntity : Identifiable {

}
