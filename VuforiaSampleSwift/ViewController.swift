//
//  ViewController.swift
//  VuforiaSample
//
//
//  Created by Andrew Mendez on 2017/02/18.
//  Copyright © 2017 Andrew Mendez. All rights reserved.
//
import UIKit

class ViewController: UIViewController, DelegateForBottomButtons, DelegateForButtonVisibility {

    func backBtnVisibility() {
        
        if backButton != nil {
            
            backButton?.isHidden = false
        }
    }
    
    func backBtnEventListener() {
        
        dismiss(animated: true, completion: nil)
    }
    
    let vuforiaLicenseKey = "AWuRRnP/////AAAAACBTnCoVPU4HkRdl+6OSD0ZQnGf5zD87ow66fy277oSM8ctxbnsQZrMsiZ69Mzi0aY6Iuv99AGOkV8J6p0ey7a0FvMlM4VSoV46nU+W7SlL6Q0P9bxoVwcypAtCHG8CWhJa9Q3vQ9Xf83L/f9pCQCs1lcw3/EpMO3Q+563xNJ/n5v+C9SS8Ss0/RH9f0uLg2tB/Cznhcshrlw3P1eiElI2ck13g5l0U4dELEO3stAzI6yx9Q+V7NSDUns7l7P329u7Lpo2amZYHXc7gM1c5iSkRxTs9dHORCdvkn1i94Y3sC+b5E5Hkh89KdHi9yjnLRBC8ZMeOAcZp7RSTysFcNSYX4Ivj+O+wznNNm8wXD2Mgi"
    
    let vuforiaDataSetFile = "radio_panel.xml"
    
    var vuforiaManager: VuforiaManager? = nil
    fileprivate var middleSceneName: String? = nil
    fileprivate var RightSceneName: String? = nil
    var arBottomButtons = ARBottomButtons()
    
    var value = 0;
    
    let boxMaterial = SCNMaterial()
    let boxMaterialC = SCNMaterial()
    fileprivate var lastSceneName: String? = nil
    var backButton:UIButton? = nil
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        do {
            try vuforiaManager?.stop()
        }catch let error {
            print("\(error)")
        }
    }
}

private extension ViewController {
    
    func prepare() {
        vuforiaManager = VuforiaManager(licenseKey: vuforiaLicenseKey, dataSetFile: vuforiaDataSetFile)
        if let manager = vuforiaManager {
            
            manager.delegate = self
            //  manager.eaglView.sceneSource = self
            manager.eaglView.delegate = self
            manager.eaglView.setupRenderer()
            self.view = manager.eaglView
            
            arBottomButtons.delegateForBottomBtns = self
            backButton = arBottomButtons.add(atBottom: self.view)
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(didRecieveWillResignActiveNotification),
                                       name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(didRecieveDidBecomeActiveNotification),
                                       name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        vuforiaManager?.prepare(with: .portrait)
    }
    
    func pause() {
        do {
            try vuforiaManager?.pause()
        }catch let error {
            print("\(error)")
        }
    }
    
    func resume() {
        do {
            try vuforiaManager?.resume()
        }catch let error {
            print("\(error)")
        }
    }
}

extension ViewController {
    func didRecieveWillResignActiveNotification(_ notification: Notification) {
        pause()
    }
    
    func didRecieveDidBecomeActiveNotification(_ notification: Notification) {
        resume()
    }
}

extension ViewController: VuforiaManagerDelegate {
    func vuforiaManagerDidFinishPreparing(_ manager: VuforiaManager!) {
        
        print("did finish preparing\n")
        
        do {
            try vuforiaManager?.start()
            vuforiaManager?.setContinuousAutofocusEnabled(true)
        }catch let error {
            print("\(error)")
        }
    }
    
    func vuforiaManager(_ manager: VuforiaManager!, didFailToPreparingWithError error: Error!) {
        print("did faid to preparing \(error)\n")
    }
    
    func vuforiaManager(_ manager: VuforiaManager!, didUpdateWith state: VuforiaState!) {
        for index in 0 ..< state.numberOfTrackableResults {
            let result = state.trackableResult(at: index)
            let trackerableName = result?.trackable.name
            print("\(String(describing: trackerableName))")
            
            
            
            
            
            
            if trackerableName == "radio_panel_left_6" || trackerableName == "radio_panel_left_5"  || trackerableName == "radio_panel_left_4" || trackerableName == "radio_panel_left_3" || trackerableName == "radio_panel_left_2" || trackerableName == "radio_panel_left_1"  {
                
                if lastSceneName != "left" {
                    
                    manager.eaglView.setNeedsChangeSceneForLeft()
                    
                    lastSceneName = "left"
                    
                }
                
                
            }
            
            if trackerableName == "radio_panel_middle_18" || trackerableName == "radio_panel_middle_17" || trackerableName == "radio_panel_middle_16"  || trackerableName == "radio_panel_middle_15" || trackerableName == "radio_panel_middle_14"  {
                
                //                || trackerableName == "radio_panel_middle_8" || trackerableName == "radio_panel_middle_7" || trackerableName == "radio_panel_middle_6" || trackerableName == "radio_panel_middle_5"  || trackerableName == "radio_panel_middle_4" || trackerableName == "radio_panel_middle_3" || trackerableName == "radio_panel_middle_2" || trackerableName == "radio_panel_middle_1"
                
                if middleSceneName != "middle" {
                    
                    manager.eaglView.setNeedsChangeSceneForMiddle()
                    
                    middleSceneName = "middle"
                    
                }
                
                
            }
            
            if trackerableName == "radio_panel_right_6" || trackerableName == "radio_panel_right_5"  || trackerableName == "radio_panel_right_4" || trackerableName == "radio_panel_right_3" || trackerableName == "radio_panel_right_2" || trackerableName == "radio_panel_right_1" {
                
                if RightSceneName != "right" {
                    
                    manager.eaglView.setNeedsChangeSceneForRight()
                    
                    RightSceneName = "right"
                    
                }
                
            }
            
            if trackerableName == " radio_panel_full_5" || trackerableName == " radio_panel_full_4"  || trackerableName == " radio_panel_full_3" || trackerableName == " radio_panel_full_2" || trackerableName == " radio_panel_full_1" {
                
                
            }
            
        }
    }
}

extension ViewController:  VuforiaEAGLViewDelegate {
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    func showEpub(epubTag:Int) {
        
        if backButton != nil {
            
            backButton?.isHidden = true
            
        }
        
        let viewController : EpubViewController =     self.storyboard!.instantiateViewController(withIdentifier: "modalVC") as! EpubViewController
        viewController.delegate = self
        viewController.providesPresentationContextTransitionStyle = true
        viewController.definesPresentationContext = true
        viewController.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext
        viewController.epubContextPathIndex = epubTag;
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    func vuforiaEAGLView(_ view: VuforiaEAGLView!, didTouchDownNode node: SCNNode!) {
        
        if isStringAnInt(string: node.name!) {
            
            let epubTag = Int(node.name!)!
            showEpub(epubTag:epubTag)
            
        }
        
        // print("touch down \(node.name!)\n")
        
    }
    
    func vuforiaEAGLView(_ view: VuforiaEAGLView!, didTouchUp node: SCNNode!) {
        //print("touch up \(node.name)\n")
        
    }
    
    func vuforiaEAGLView(_ view: VuforiaEAGLView!, didTouchCancel node: SCNNode!) {
        //print("touch cancel \(node.name)\n")
        
    }
}

