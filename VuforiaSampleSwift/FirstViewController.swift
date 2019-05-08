//
//  FirstViewController.swift
//  VuforiaSampleSwift
//
//  Created by mobioapp on 9/13/17.
//  Copyright © 2017 Yoshihiro Kato. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var i = 0
    var timer: Timer?
    
    @IBOutlet weak var scanButton: UIButton!
    
    var imageArray = ["scan_1.png","scan_2.png","scan_3.png","scan_4.png","scan_5.png","scan_6.png","scan_7.png","scan_8.png","scan_9.png","scan_10.png","scan_11.png","scan_12.png","scan_13.png","scan_14.png","scan_15.png","scan_16.png","scan_17.png","scan_18.png","scan_19.png","scan_20.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     downloadAndSaveInDoccumentDic()
         downloadAndSaveInDoccumentDicleft()
        startTimer()
    }
  
    // handle orientation ...
    
    /*
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
    }
    
    func canRotate() -> Void {}
    */
    
    
    func startTimer() {
        
        if timer == nil {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.loop), userInfo: nil, repeats: true)
            
        }
    }
    
    func loop() {
        
        self.repeatedAfterFewSecond()
        
        
    }
    
    
    func repeatedAfterFewSecond() {
        
        scanButton.setBackgroundImage(UIImage(named : imageArray[i%20]), for: .normal)
        i += 1
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnEventListener(_ sender: Any) {
        
        
    }
    
    
   
    
    func downloadAndSaveInDoccumentDic () -> Void {
        http://192.168.1.253:5000/fbsharing/fRqIpFpU
        if let audioUrl = URL(string: "http://192.168.1.253:5000/fbsharing/aqYSs1W6") {
            
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent("right.scn")
            print(destinationUrl)
            
            // to check if it exists before downloading it
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                print("The file already exists at path")
                
                // if the file doesn't exist
            } else {
                
                // you can use NSURLSession.sharedSession to download the data asynchronously
                URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
                    guard let location = location, error == nil else { return }
                    do {
                        // after downloading your file you need to move it to your destination url
                        try FileManager.default.moveItem(at: location, to: destinationUrl)
                        print("File moved to documents folder")
                        //getImage()
                        
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }).resume()
            }
        }
        
    }
    
    func downloadAndSaveInDoccumentDicleft () -> Void {
        
            if let audioUrl = URL(string: "http://192.168.1.253:5000/fbsharing/fRqIpFpU") {
            
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent("left.scn")
            print(destinationUrl)
            
            // to check if it exists before downloading it
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                print("The file already exists at path")
                
                // if the file doesn't exist
            } else {
                
                // you can use NSURLSession.sharedSession to download the data asynchronously
                URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
                    guard let location = location, error == nil else { return }
                    do {
                        // after downloading your file you need to move it to your destination url
                        try FileManager.default.moveItem(at: location, to: destinationUrl)
                        print("File moved to documents folder")
                        //getImage()
                        
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }).resume()
            }
        }
        
    }
    
    
    
    
}
