//
//  ViewControllerLoader.swift
//  MedTermIT
//
//  Created by AppsCreationTech on 3/9/17.
//  Copyright © 2017 AppsCreationTech. All rights reserved.
//

import UIKit

class ViewControllerLoader: UIViewController {
    

    @IBOutlet weak var loadingView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        loadingView.addUntitled1Animation(totalDuration: 3) { (true) in
        
        }
        // Do any additional setup after loading the view.
    }
      
    
    func timeToMoveOn() {
        self.performSegue(withIdentifier: "goToMainUI", sender: self)
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
