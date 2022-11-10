//
//  firstviewcontroler.swift
//  project
//
//  Created by husseinharb on 7/19/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//

import UIKit

class firstviewcontroler: UIViewController {

    var namefromwelcome :String = "Guest"
    var lastnamefromwelcome : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    

      
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.destination is MCQ_QUIZViewController{
            
            let vc = segue.destination as? MCQ_QUIZViewController
            vc?.nameforuser = namefromwelcome
            vc?.lastnamefromwelcome = lastnamefromwelcome
            
        }
    
    
    

}
}
