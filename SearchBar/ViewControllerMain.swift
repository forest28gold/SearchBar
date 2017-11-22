//
//  ViewController2.swift
//  SearchBar
//
//  Created by AppsCreationTech on 2/24/17.
//  Copyright © 2017 AppsCreationTech. All rights reserved.
//

import Foundation
import UIKit


class ViewControllerMain: UIViewController, UITextViewDelegate{
    
    
   

    @IBOutlet weak var leadingconstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.automaticallyAdjustsScrollViewInsets = false

        //Customizing the navigation bar completely and dynamically
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.barTintColor = UIColor(red:0.17, green:0.40, blue:1.00, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        //Menu shadowOpacity shows the shadow, shadowradius increases the shadow radius....
         menuView.layer.shadowOpacity = 1
         menuView.layer.shadowRadius = 5
        self.navigationItem.leftBarButtonItem?.title = "Menu"
        self.navigationItem.leftBarButtonItem?.image = (#imageLiteral(resourceName: "Menu-25"))
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Dismiss2(_ sender: Any) {
        leadingconstraint.constant = -280
        menuShowing = !menuShowing
    }

    
    override func viewWillAppear(_ animated: Bool) {
        leadingconstraint.constant = -280
        menuShowing = false
    }

    @IBAction func openMenu(_ sender: Any) {
        if(menuShowing) {
            
            leadingconstraint.constant = -280
            
        } else {
            
            leadingconstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            
        }
        menuShowing = !menuShowing

    }
    
     @IBAction func AllButton(_ sender: Any) {
        if(menuShowing) {
            
            leadingconstraint.constant = -280
            
        } else {
            
            leadingconstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded()})
            
        }
        menuShowing = !menuShowing

        
    }
   
    
}
