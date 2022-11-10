//
//  QuizAttempt+CoreDataProperties.swift
//  DQL
//
//  Created by user199469 on 8/1/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//
//

import Foundation
import CoreData


extension QuizAttempt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuizAttempt> {
        return NSFetchRequest<QuizAttempt>(entityName: "QuizAttempt")
    }

    @NSManaged public var questions: [Question]?

}
