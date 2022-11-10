//
//  QuizPool+CoreDataProperties.swift
//  DQL
//
//  Created by user199469 on 8/1/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//
//

import Foundation
import CoreData


extension QuizPool {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuizPool> {
        return NSFetchRequest<QuizPool>(entityName: "QuizPool")
    }

    @NSManaged public var attempts: [QuizAttempt]?

}

extension QuizPool : Identifiable {

}
