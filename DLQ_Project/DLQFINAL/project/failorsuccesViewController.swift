//
//  failorsuccesViewController.swift
//  project
//
//  Created by husseinharb on 7/23/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//

import UIKit



class failorsuccesViewController: UIViewController {


    
    @IBOutlet weak var failorsucesslabel: UILabel!
    @IBOutlet weak var xorrighttick: UIImageView!
    @IBOutlet weak var finalscore: UILabel!
    @IBOutlet weak var backgroundimg: UIImageView!

    
    
    var succed = ""
    var  fscore = 0
    var namefromwelcome : String = "Guest"
    var lastnamefromwelcome : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        self.navigationController?.isNavigationBarHidden = true
        
                    if succed == "No"{
                        failorsucesslabel.text = "You failed \(namefromwelcome) \(lastnamefromwelcome)!"
            failorsucesslabel.textColor = UIColor(named: "Black")
            xorrighttick.image = UIImage(named: "x")
            backgroundimg.image = UIImage(named: "whitepage")
            finalscore.text  = "score: \(fscore)"
                finalscore.textColor = UIColor(named: "Black")
                
            }
                else{
                    
                finalscore.text  = "score: \(fscore)"
                failorsucesslabel.text = "congratulation \(namefromwelcome)\(lastnamefromwelcome)!"
                }
            
    }


    
    @IBAction func clickonme(_ sender: Any) {
  
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    
    }
  
    
  /*  func returnstring()->String{
        let vc = welcomepageViewController()
       return  vc.text
        
        
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



