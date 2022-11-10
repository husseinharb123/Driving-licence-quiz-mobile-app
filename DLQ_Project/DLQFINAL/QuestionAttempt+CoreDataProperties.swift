//
//  QuestionAttempt+CoreDataProperties.swift
//  DQL
//
//  Created by user199469 on 8/1/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//
//

import Foundation
import CoreData


extension QuestionAttempt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionAttempt> {
        return NSFetchRequest<QuestionAttempt>(entityName: "QuestionAttempt")
    }

    @NSManaged public var questionNumber: String?
    @NSManaged public var correctlyAnswered: Bool

}

extension QuestionAttempt : Identifiable {

}
