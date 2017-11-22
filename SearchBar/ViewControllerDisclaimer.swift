//
//  ViewControllerDisclaimer.swift
//  MedTermIT
//
//  Created by AppsCreationTech on 3/26/17.
//  Copyright © 2017 AppsCreationTech. All rights reserved.
//

import UIKit

class ViewControllerDisclaimer: UIViewController {

    
        override func viewDidLoad() {
            super.viewDidLoad()
           
            
    }
        
    @IBAction func goToApp(_ sender: Any) {
        self.performSegue(withIdentifier: "openApp", sender: self)

    }
        
    
        override func viewDidAppear(_ animated: Bool) {
            self.navigationController?.isNavigationBarHidden = true
            
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            self.navigationController?.isNavigationBarHidden = false
            
        }
        
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
