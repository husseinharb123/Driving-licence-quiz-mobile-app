//
//  bankofquestions.swift
//  project
//
//  Created by husseinharb on 7/19/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//

import Foundation


class bankofquestions{
    
    var list = [Question]()
    
    init(){
        
        list.append(Question(questionimage: "Bend to right", questionmcq: "This sign means? ", optionA: "A. Bend to right", optionB : "B. Distance to Stop line", optionc:"C. Double bend (first to the left)", optionD: "D. Distance ahead to a parking place", correct: 1))
      
        list.append(Question(questionimage: "No motor vehicles", questionmcq: "This sign means? ", optionA: "A. No pedestrians", optionB : "B. No motor vehicles", optionc:"C. Primary route", optionD: "D. Staggered junction", correct: 2))

    list.append(Question(questionimage: "The maximum speed, in miles per hour", questionmcq: "This sign means? ", optionA: "A. Crossroads", optionB : "B. No motor vehicles", optionc:"C. Distance to Stop line", optionD: "D. The maximum speed, in miles per hour", correct: 4))
        
    list.append(Question(questionimage: "Primary route", questionmcq: "This sign means? ", optionA: "A. No towed caravans", optionB : "B. Non-primary route", optionc:"C. Primary route", optionD: "D. Roundabout", correct: 3))



list.append(Question(questionimage: "Double bend (first to the left)", questionmcq: "This sign means? ", optionA: "A. No motor vehicles", optionB : "B. Double bend (first to the left) vehicles", optionc:"C. Primary route", optionD: "D. Staggered junction", correct: 2))



    list.append(Question(questionimage: "Traffic signals ahead", questionmcq: "This sign means?", optionA: "A. Traffic signals ahead", optionB : "B. No towed caravans", optionc:"C. Primary route", optionD: "D. Start of motorway regulations", correct: 1))


        
        
        
        
            list.append(Question(questionimage: "No towed caravans", questionmcq: "This sign means? ", optionA: "A. Crossroads", optionB : "B. No motor vehicles", optionc:"C. Distance to Stop line", optionD: "D.No towed caravans", correct: 4))
                
            list.append(Question(questionimage: "Staggered junction", questionmcq: "This sign means? ", optionA: "A. Staggered junction", optionB : "B. Non-primary route", optionc:"C. Primary route", optionD: "D. Roundabout", correct: 1))



        list.append(Question(questionimage: "Non-primary route", questionmcq: "This sign means? ", optionA: "A. No motor vehicles", optionB : "B. Non-primary route", optionc:"C. Primary route", optionD: "D. Staggered junction", correct: 2))



            list.append(Question(questionimage: "Distance to Stop line", questionmcq: "This sign means?", optionA: "A. Traffic signals ahead", optionB : "B. No towed caravans", optionc:"C. Distance to Stop line", optionD: "D. Start of motorway regulations", correct: 3))
        
        
        
}
}
