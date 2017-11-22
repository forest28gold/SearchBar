// YPDrawSignatureView is open source
// Version 0.2.2
//
// Copyright (c) 2014 - 2016 Yuppielabel and the project contributors
// Available under the MIT license
//
// See https://github.com/yuppielabel/YPDrawSignatureView/blob/master/LICENSE for license information
// See https://github.com/yuppielabel/YPDrawSignatureView/blob/master/README.md for the list project contributors

import UIKit
import CoreData

class ViewControllerxxx: UIViewController, YPSignatureDelegate {
    
    @IBOutlet weak var overrideView: UIImageView!
    
    @IBOutlet weak var Label: UILabel!

    var recievedString: String = ""
    

    // Connect this Outlet to the Signature View
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    // Function to call for new directory on the users phone to store their notes
    func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }
    
    // Function to call to retrieve directory on the users phone which stores the notes
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label.text = recievedString
        let Labels = recievedString
        // Do any additional setup after loading the view, typically from a nib.
        signatureView.delegate = self
        
        // Command to retrieve the terms image and display it when the notes page appears
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            // filter the directory contents for a specific extension and choose the name at the end of the URL
            let imageNames = directoryContents.filter { $0.pathExtension == "jpg" }.map { $0.lastPathComponent }
            print("ImageNames:" , imageNames)
            //let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(imageNames.last!)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(Labels+".jpg")
            self.overrideView.image = UIImage(contentsOfFile: imagePAth)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Generates the string name for the note being saved
    func generateRandomStringWithLength(length: Int) -> String {
        
        let jpgExt = ".jpg"
        return(recievedString+jpgExt)
        
        
    }

    @IBAction func clearSignature(_ sender: UIButton) {
        // This is how the signature gets cleared
        self.signatureView.clear()
    }
    
    
    @IBAction func saveSignature(_ sender: UIButton) {
        // Getting the Signature Image from self.drawSignatureView using the method getSignature().
        if let signatureImage = self.signatureView.getSignature(scale: 10) {
            let ImageName = generateRandomStringWithLength(length: 4)
            print(ImageName)
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(ImageName)
            let image = UIImagePNGRepresentation(signatureImage)
            fileManager.createFile(atPath: paths as String, contents: image, attributes: nil)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(ImageName)
            print(imagePAth)
            
            // Command to clear the screen after the save button is clicked
            self.signatureView.clear()
        }
    }
    
    // The delegate methods gives feedback to the instanciating class
    func finishedDrawing() {
        print("Finished")
    }
    
    func startedDrawing() {
        print("Started")
    }
   
    @IBAction func Eraser(_ sender: Any) {
        
        self.signatureView.changecolor = UIColor.blue
    
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC: ViewController123 = segue.destination as! ViewController123
        secondVC.recievedString = Label.text!
       
        
    }

    
    
}
