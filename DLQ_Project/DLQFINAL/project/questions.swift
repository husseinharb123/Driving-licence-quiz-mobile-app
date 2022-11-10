//
//  questions.swift
//  project
//
//  Created by husseinharb on 7/19/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//

import Foundation


class Question {
    
    let questionimage : String
    let questionmcq : String
    let optionA : String
    let optionB : String
    let optionc : String
    let optionD : String
    let correct : Int
    
    init(   questionimage : String, questionmcq : String, optionA : String , optionB : String ,optionc : String ,optionD : String ,correct : Int) {
        
        
        self.questionimage = questionimage
        self.questionmcq = questionmcq
        self.optionA = optionA
        self.optionB = optionB
        self.optionc = optionc
        self.optionD = optionD
        self.correct = correct
 
    }
}


