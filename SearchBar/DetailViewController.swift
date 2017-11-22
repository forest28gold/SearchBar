import UIKit
import WebKit
import JavaScriptCore
import AVFoundation
import AVKit

class DetailViewController: UIViewController, UITextViewDelegate, WKNavigationDelegate {

    
    var webView: WKWebView!
    
    @IBAction func reportLink(_ sender: Any) {
        
        let email = "reportlink@integral6.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
        print("sennnt")
    }

//    @IBAction func webview(_ sender: Any) {
//        self.performSegue(withIdentifier: "WebSegue", sender: self)
//    }
    
    
    @IBOutlet weak var VideoError: UIImageView!
    
    //from prev controller
    var dataModel:Model!
    
    var videoURL: NSURL!
    
    
    //IBOutlets
    @IBOutlet weak var imageTermLabel: UITextView!
    @IBOutlet weak var DefinitionLabel: UITextView!
    @IBOutlet weak var TypesLabel: UITextView!
    @IBOutlet weak var wv: UIWebView!
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")

        UIApplication.shared.statusBarStyle = .lightContent
        
        imageTermLabel.text = dataModel.imageTerm
        DefinitionLabel.text = dataModel.imageDefinition
        TypesLabel.text = dataModel.imageTypes
        let videoLink = dataModel.imageVideo
        
        //Youtube or Video embedding
        //body style in the loadHTMLString solves frame center issue
        wv.scrollView.isScrollEnabled = false
        wv.allowsInlineMediaPlayback = true
        wv.isUserInteractionEnabled = true
       
        
        let empty = ""
        if videoLink == "https://vimeo.com/66150307"  {
            
            wv.loadRequest(URLRequest(url: URL(string: videoLink)!))
            VideoError.isHidden = true
            
           

        } else if videoLink.range(of:"youtube") != nil {
            VideoError.isHidden = true
            
            let index = videoLink.index(videoLink.startIndex, offsetBy: 32)
            let newid = videoLink.substring(from: index)
            print(newid)
            let http = "https://www.youtube.com/embed/"
            let showInfo = "?showinfo=0?&playsinline=1"
            let newURL = http + newid + showInfo
            print(newURL)
            wv.loadHTMLString("<body style=\"margin: 0; padding: 0;\"><iframe width=\"760\" height=\"660\" src=\"\(newURL)\" frameborder=\"0\" allowfullscreen></iframe></body>",baseURL: nil)
            
         
        } else if videoLink == empty {
            VideoError.isHidden = false
            
        } else if videoLink.range(of:"vimeo") != nil {
           
            let index = videoLink.index(videoLink.startIndex, offsetBy: 18)
            print(index)
            let newid = videoLink.substring(from: index)
            print(newid)
            
            
            
            let embedHTML="<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe src=\"//player.vimeo.com/video/\(newid)?autoplay=1&amp;loop=1\" width=\"760\" height=\"660\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>";
            
            
            let url: NSURL = NSURL(string: "http://")!
            
            wv.loadHTMLString(embedHTML as String ,baseURL: url as URL)
            
            VideoError.isHidden = true

        }
        
    }
    
        //Override function to change status bar color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NotesSegue"{
            let secondVC: ViewController = segue.destination as! ViewController
            secondVC.recievedString = imageTermLabel.text

        }else if segue.identifier == "WebSegue" {
            
            let third: WebViewController = segue.destination as! WebViewController
            let webURL = dataModel.imageLink
            third.recievedString = webURL

        }
    }
    


    
    
    
    
}
