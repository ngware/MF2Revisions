//
//  Question+CoreDataProperties.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 08/08/2024.
//
//

import Foundation
import CoreData


extension Question : Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var viewCount: Int32
    @NSManaged public var theme: String?
    @NSManaged public var question: String?
    @NSManaged public var points: String?
    @NSManaged public var id: Int32
    @NSManaged public var field: String?
    @NSManaged public var date: String?
    @NSManaged public var city: String?
    @NSManaged public var answer: String?

}

