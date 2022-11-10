//
//  MCQ_QUIZViewController.swift
//  project
//
//  Created by husseinharb on 7/19/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//
import UIKit
import CoreData

class MCQ_QUIZViewController: UIViewController {

    
    @IBOutlet weak var questioncountre: UILabel!
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var signview: UIImageView!
    @IBOutlet weak var submitbutton: UIButton!
    
    
    let dataContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let allquestions = bankofquestions()
    var questionnumberss : Int = 0
    var score : Int = 0 ;
    var selectedone : Int = 0 ;
    var nameforuser : String = "Guest"
    var lastnamefromwelcome : String = ""
    var attempt:QuizAttempt = QuizAttempt()
    var myDictionary:[String:String] = [:]   // here is the dictionary
    var questionTimer:Date = Date()
    var quizTimer:Date = Date()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.attempt = QuizAttempt(context: self.dataContext)
        self.attempt.name = nameforuser
        self.attempt.startStamp = Date()
        updatequestion()
        updateui()
        if questionnumberss == allquestions.list.count {
            restartquiz()
        }
        
        
        
    }
    
    
    @IBAction func clickonanswser(_ sender: UIButton) {
        if questionnumberss < allquestions.list.count {
            let qa = QuestionAttempt(context: self.dataContext)
            qa.questionImage = self.allquestions.list[self.questionnumberss].questionimage
            if sender.tag == selectedone{
                score += 10;
                qa.correctlyAnswered = true
                self.attempt.addToQuestions(qa)
            }
            else {
                qa.correctlyAnswered = false
                self.attempt.addToQuestions(qa)
            }
            questionnumberss += 1
            qa.secondsTaken = self.getTimeDifferent(self.questionTimer, Date())
            updatequestion()
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        do {
            self.attempt.secondsTaken = self.getTimeDifferent(self.attempt.startStamp!, Date())
            self.attempt.grade = Int64(score)
            try self.dataContext.save()
            
        } catch {
            dump("Failed to save data to core data.")
        }
        let recivervc = segue.destination as! failorsuccesViewController
        if score < 50 {recivervc.succed = "No"}
        else {recivervc.succed = "yes"}
        recivervc.fscore = score
        
        recivervc.namefromwelcome = nameforuser
        recivervc.lastnamefromwelcome = lastnamefromwelcome
    }
    
    
    
    
    func updatequestion(){

        if questionnumberss < allquestions.list.count{
            
            
            signview.image = UIImage(named: allquestions.list[questionnumberss].questionimage)
                questionlabel.text = allquestions.list[questionnumberss].questionmcq
                  
                  option1.setTitle(allquestions.list[questionnumberss].optionA, for: UIControl.State.normal)
                  
                    option2.setTitle(allquestions.list[questionnumberss].optionB, for: UIControl.State.normal)
                
                    option3.setTitle(allquestions.list[questionnumberss].optionc, for: UIControl.State.normal)
                 
                    option4.setTitle(allquestions.list[questionnumberss].optionD, for: UIControl.State.normal)
                  selectedone = allquestions.list[questionnumberss].correct
                   
        }

        
        updateui()
        self.questionTimer = Date()
    }
            
    func getTimeDifferent(_ oldDate:Date, _ newDate:Date) -> Int64 {
        let old = oldDate.timeIntervalSinceReferenceDate
        let new = newDate.timeIntervalSinceReferenceDate
        return Int64(new-old)
    }
            
        
 
    func updateui() {
    

        if    questionnumberss < allquestions.list.count{
            questioncountre.text = "\(questionnumberss+1)/\(allquestions.list.count)"
        
        }
    }
    
    
    
    func restartquiz(){
        score = 0;
        questionnumberss = 0 ;
        updatequestion();
        
    }
    

    
func update_ui_resultscore(){
    let vc = failorsuccesViewController()
     if score < 50{vc.succed = "No"}
     else {vc.succed = " yes"}
    let main = UIStoryboard(name: "Main", bundle: nil)
    let second = main.instantiateViewController(withIdentifier: "failorsucess")
    self.present(second, animated: true ,completion: nil)
   
    
    
    }


    


}//class
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


