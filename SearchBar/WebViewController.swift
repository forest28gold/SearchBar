//
//  WebViewController.swift
//  MedTermIT
//
//  Created by AppsCreationTech on 3/23/17.
//  Copyright © 2017 AppsCreationTech. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var wv2: UIWebView!
    
    var recievedString: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        wv2.loadRequest(URLRequest(url: URL(string: recievedString)!))
        print(recievedString)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        self.wv2.frame = self.view.frame
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.wv2.frame = self.view.frame

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
