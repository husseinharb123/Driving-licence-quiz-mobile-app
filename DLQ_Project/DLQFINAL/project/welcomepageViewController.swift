//
//  welcomepageViewController.swift
//  project
//
//  Created by husseinharb on 7/23/21.
//  Copyright © 2021 husseinharb. All rights reserved.
//

import UIKit

class welcomepageViewController: UIViewController {

    @IBOutlet weak var Lastname: UITextField!
    @IBOutlet weak var Name: UITextField!
    
  
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dississkeyboard))
        self.view.addGestureRecognizer(tap)
        
    
    }
    
    
    @objc func dississkeyboard(){
        self.view.endEditing(true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.destination is firstviewcontroler{
            
            let vc = segue.destination as? firstviewcontroler
            vc?.namefromwelcome = Name.text ?? ""
            vc?.lastnamefromwelcome = Lastname.text ?? ""
            
            
            
        }
    
    
    
    
    
    }
    


    
    
}
