//
//  ViewController.swift
//  MedTermIT
//
//  Created by Hamzah on 3/2/17.
//  Copyright © 2017 Integral6. All rights reserved.
//

import UIKit

class ViewController123: UIViewController  {

    
    
    @IBOutlet weak var myImageView: UIImageView!

    var recievedString: String = ""
    
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Label = recievedString
        
        print(Label)
        
        /*let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yDLe.jpg")
        
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent("yDLe.jpg")
        print(imagePAth)
        if fileManager.fileExists(atPath: imagePAth){
            self.myImageView.image = UIImage(contentsOfFile: imagePAth)
        }else{
            print("No Image")
        }*/
        
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            //print(directoryContents)
            
            // filter the directory contents for a specific extension and choose the name at the end of the URL
            let imageNames = directoryContents.filter { $0.pathExtension == "jpg" }.map { $0.lastPathComponent }
            print("ImageNames:" , imageNames)
            //let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(imageNames.last!)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(Label+".jpg")

            self.myImageView.image = UIImage(contentsOfFile: imagePAth)


            //let noteImageNames = noteImages.map{ $0.deletingPathExtension().lastPathComponent }
            //print("noteNames:", noteImageNames)
           // let image = noteImages.first
           // print(image!)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextImage(_ sender: Any) {
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            //print(directoryContents)
            
            // filter the directory contents for a specific extension and choose the name at the end of the URL
            let imageNames = directoryContents.filter { $0.pathExtension == "jpg" }.map { $0.lastPathComponent }
            print("ImageNames:" , imageNames)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(imageNames.last!)
            self.myImageView.image = UIImage(contentsOfFile: imagePAth)
            
            let array = imageNames
            for item in array {
                print("Found \(item)")
            }

        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        
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
