//
//  mynavViewController.swift
//  project
//
//  Created by husseinharb on 7/24/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//

import UIKit
import CoreData





class InsightsViewController: UIViewController {
    
    
    
    @IBOutlet weak var lastquiz: UILabel!
    @IBOutlet weak var fastest: UILabel!
    @IBOutlet weak var harestSign: UIImage!
    @IBOutlet weak var hardestq: UILabel!
    @IBOutlet weak var avg: UILabel!
    @IBOutlet weak var quizzesdone: UILabel!
    let dataContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var attempts:[QuizAttempt] = [QuizAttempt]()
    var dateF:DateFormatter = DateFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateF.dateFormat = "yyyy-MM-dd HH:mm"
        fetchAttempts()
        quizzesdone.text = getTotalQuizzes()
        avg.text = getAverageGrade()
        hardestq.text = getToughestQuestion()
        fastest.text = getFastestAttempt()
        lastquiz.text = getLastQuizDate()
        
        // Do any additional setup after loading the view.
        
    }
    func fetchAttempts() {
        // fetches all the QuizAttempt objects from CoreData
        do {
            self.attempts = try self.dataContext.fetch(QuizAttempt.fetchRequest())
        } catch {
            dump("failed to load from core data")
        }
    }
    func getDateString(_ source:Date) -> String {
        // HELPER FUNCTION
        // Converts any Date object into a string useing the format defined on self.dateF
        return self.dateF.string(from: source)
    }
    func getDeltaTimeString(_ source:Int) -> String {
        // HELPER FUNCTION
        // Converts int representing number of seconds into a string with MM:SS format
        let mins = source/60
        let sec = source%60
        return String(mins) + ":" + String(sec)
    }
    func getToughestQuestion() -> String {
        // gets the name of the image file related to the sign which was mistaken most often
        var counter:[String:Int] = [String:Int]() // keeps a record of the number of times a user made a mistake in a question
        for attempt in self.attempts {
            let questions = attempt.questions?.allObjects as! [QuestionAttempt]
            for question in questions {
                if !question.correctlyAnswered {
                    if counter[question.questionImage!] == nil {
                        counter[question.questionImage!] = 1
                    } else {
                        counter[question.questionImage!]! += 1
                    }
                }
            }
        }
        var toughest = (a:"",b:0)
        for questionname in counter.keys.sorted() {
            if counter[questionname]! > toughest.b {
                toughest.a = questionname
                toughest.b = counter[questionname]!
            }
        }
        if toughest.b == 0 {
            return "No attempts yet"
        }
        return toughest.a
    }
    func getAverageGrade() -> String {
        // returns a String with the average grade
        var tot = 0
        var num = 0
        for attempt in attempts {
            tot += Int(attempt.grade)
            num += 1
        }
        if num == 0 {
            return String(0)
        }
        return String(tot/num)
    }
    func getLastQuizDate() -> String {
        // gets a string representation of the last quiz start date
        if self.attempts.isEmpty {
            return "No attempts yet"
        } else {
            var date = attempts[0].startStamp!
            for attempt in attempts {
                if date < attempt.startStamp! {
                    date = attempt.startStamp!
                }
            }
            return getDateString(date)
        }
    }
    func getTotalQuizzes() -> String{
        // gets a string representation of the total quantity of quizzes taken
        if self.attempts.isEmpty {
            return String(0)
        } else {
            return String(self.attempts.count)
        }
    }
    func getFastestAttempt() -> String {
        // gets a string with the amount of time taken on the fasted successful attempt
        if self.attempts.isEmpty {
            return "No attempts yet"
        } else {
            var fastest = self.attempts[0]
            for attempt in attempts {
                if attempt.secondsTaken < fastest.secondsTaken && attempt.grade >= 60 {
                    fastest = attempt
                }
            }
            if fastest.grade < 60 {
                return "You haven't successfully completed a quiz yet"
            } else {
                return self.getDeltaTimeString(Int(fastest.secondsTaken)) + " by " + fastest.name!
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
