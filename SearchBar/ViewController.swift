//
//  ViewController.swift
//  MedTermIT
//
//  Created by AppsCreationTech on 3/7/17.
//  Copyright © 2017 AppsCreationTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate {
    
    let context = UIGraphicsGetCurrentContext()

    @IBOutlet weak var Eraser: UILabel!
    @IBOutlet weak var Cleared: UILabel!
    @IBOutlet weak var Save: UILabel!
    
    private var path = UIBezierPath()
    private var points = [CGPoint](repeating: CGPoint(), count: 5)
    
    private var controlPoint = 0
    
    var recievedString: String = ""

    @IBOutlet weak var Label: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var toolIcon: UIButton!
    var lastPoint = CGPoint.zero
    var swiped = false
    
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    var sizes:CGFloat = 5

    var tool:UIImageView!
    var isDrawing = true
    var selectedImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        
   
        
        tool = UIImageView()
        Save.text = "Save"
        Cleared.text = "Clear"
        Eraser.text = "Erase"
        tool = UIImageView()
        tool.frame = CGRect(x: self.view.bounds.size.width, y: self.view.bounds.size.height, width: 38, height: 38)
    
        
        
        self.view.addSubview(tool)
        
        self.Label.text = self.recievedString
        let Labels = self.recievedString
        
        // Command to retrieve the terms image and display it when the notes page appears
        
        do {
            // Get the directory contents urls (including subfolders urls)
            // filter the directory contents for a specific extension and choose the name at the end of the URL
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(Labels+".jpg")
            self.imageView.image = UIImage(contentsOfFile: imagePAth)
            
        }
        
        
    
    }
    
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
    
    func generateRandomStringWithLength(length: Int) -> String {
        
        let jpgExt = ".jpg"
        return(recievedString+jpgExt)
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        tool.center = toPoint
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
        context?.setLineWidth(CGFloat(sizes))

        context?.strokePath()

        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBInspectable public var strokeWidth: CGFloat = 2.0 {
        didSet {
            self.path.lineWidth = strokeWidth
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        self.controlPoint += 1

        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
            
        }
        if (self.controlPoint == 4) {
            self.points[3] = CGPoint(x: (self.points[2].x + self.points[4].x)/2.0, y: (self.points[2].y + self.points[4].y)/2.0)
            self.path.move(to: self.points[0])
            self.path.addCurve(to: self.points[3], controlPoint1:self.points[1], controlPoint2:self.points[2])
            
            self.view.setNeedsDisplay()
            self.points[0] = self.points[3]
            self.points[1] = self.points[4]
            self.controlPoint = 1
        }

        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
         //   drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
        if self.controlPoint == 0 {
            let touchPoint = self.points[0]
            self.path.move(to: CGPoint(x: touchPoint.x-1.0,y: touchPoint.y))
            self.path.addLine(to: CGPoint(x: touchPoint.x+1.0,y: touchPoint.y))
            self.view.setNeedsDisplay()
        } else {
            self.controlPoint = 0
        }

    }
    
    
    
    @IBAction func reset(_ sender: AnyObject) {
        //let actionSheet = UIAlertController(title: "Are you sure you want clear the note?", message: "", preferredStyle: .actionSheet)
        //actionSheet.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
        /*let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Please select", message: "Option to select", preferredStyle: .actionSheet)
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { void in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
     
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)*/
        
        
        
        let alert = UIAlertController(title: "Clear and Save?", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction) in
            self.imageView.image = nil

            let image = #imageLiteral(resourceName: "search-3-512")
            let ImageName = self.generateRandomStringWithLength(length: 4)
            print(ImageName)
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(ImageName)
            let imageTOpng = UIImagePNGRepresentation(image)
            fileManager.createFile(atPath: paths as String, contents: imageTOpng, attributes: nil)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(ImageName)
            print(imagePAth)
}))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))

        self.present(alert, animated: true, completion: nil)

      //  actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
     //   present(actionSheet, animated: true, completion: nil)
    }
    
    // CHECK TO SEE THIS..........
    @IBAction func save(_ sender: AnyObject) {
        
       /* self.Label.text = self.recievedString
        let Labels = self.recievedString
        
        // Command to retrieve the terms image and display it when the notes page appears
        
        do {
            // Get the directory contents urls (including subfolders urls)
            // filter the directory contents for a specific extension and choose the name at the end of the URL
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(Labels+".jpg")
            self.imageView.image = UIImage(contentsOfFile: imagePAth)
            
        }
        
    
 */
        let cleared = self.imageView.image

        if cleared == nil {
            let line = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 1))
            line.backgroundColor = UIColor.green
            self.view.addSubview(tool)
            let image = #imageLiteral(resourceName: "search-3-512")
            let ImageName = self.generateRandomStringWithLength(length: 4)
            print(ImageName)
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(ImageName)
            let imageTOpng = UIImagePNGRepresentation(image)
            fileManager.createFile(atPath: paths as String, contents: imageTOpng, attributes: nil)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(ImageName)
            print(imagePAth)
            
            let alert = UIAlertController(title: "Saved", message: "Successfullys", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)


            
        } else {
            
            let image = self.imageView.image
            let ImageName = self.generateRandomStringWithLength(length: 4)
            print(ImageName)
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(ImageName)
            let imageTOpng = UIImagePNGRepresentation(image!)
            fileManager.createFile(atPath: paths as String, contents: imageTOpng, attributes: nil)
            let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(ImageName)
            print(imagePAth)
            
            let alert = UIAlertController(title: "Saved", message: "Successfully", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
            }
  /*      let actionSheet = UIAlertController(title: "Choose an Option", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Retrieve Last Note", style: .default, handler: { (_) in
     
            
            self.Label.text = self.recievedString
            let Labels = self.recievedString
            
            // Command to retrieve the terms image and display it when the notes page appears
            
            do {
                // Get the directory contents urls (including subfolders urls)
                // filter the directory contents for a specific extension and choose the name at the end of the URL
                let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(Labels+".jpg")
                self.imageView.image = UIImage(contentsOfFile: imagePAth)
                
            }
            
        }))
 

        
        actionSheet.addAction(UIAlertAction(title: "Save Note", style: .default, handler: { (_) in
            if let image = self.imageView.image {
                let ImageName = self.generateRandomStringWithLength(length: 4)
                print(ImageName)
                let fileManager = FileManager.default
                let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(ImageName)
                let imageTOpng = UIImagePNGRepresentation(image)
                fileManager.createFile(atPath: paths as String, contents: imageTOpng, attributes: nil)
                let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(ImageName)
                print(imagePAth)

            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
        
    }
  */
        
    @IBAction func drawLines(_ sender: AnyObject) {
        
        
        if (isDrawing) {
            (red,green,blue) = (1,1,1)
            (sizes) = (40)
        }
        
        
    }
  


    
    @IBAction func YellowButton(_ sender: Any) {
        (red,green,blue) = (1,1,0)
        (sizes) = (5)

        
    }
    
      @IBAction func BlueButton(_ sender: Any) {
            (red,green,blue) = (0,0,1)
            (sizes) = (5)
        
    }
    
    
        @IBAction func RedButton(_ sender: Any) {
        (red,green,blue) = (1,0,0)
        
        (sizes) = (5)
   
       
        
       

    }
    
    
    @IBAction func GreenColor(_ sender: Any) {
        (red,green,blue) = (0,1,0)
        (sizes) = (5)
   

     

    }
    

    
    
    @IBAction func BlackColor(_ sender: Any) {
        
        (red,green,blue) = (0,0,0)
        (sizes) = (5)
     
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
       
    }
    
    
}



    
    
    



















