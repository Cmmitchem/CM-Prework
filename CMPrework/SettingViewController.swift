//
//  SettingViewController.swift
//  CMPrework
//
//  Created by Caroline Mitchem on 2/2/22.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet weak var tipField1: UITextField!
    @IBOutlet weak var tipField2: UITextField!
    @IBOutlet weak var tipField3: UITextField!
    
    @IBOutlet weak var modeControl: UISegmentedControl!
    let defaults = UserDefaults.standard
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Tip Calculator Settings"
        // Do any additional setup after loading the view.
//        if(defaults.bool(forKey: "darkModeEnabled")){
//            overrideUserInterfaceStyle = .dark
//        }
//        else if !(defaults.bool(forKey: "darkModeEnabled")){
//            overrideUserInterfaceStyle = .light
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        if(defaults.bool(forKey: "darkModeEnabled")){
            overrideUserInterfaceStyle = .dark
            print("dark mode enabled")
            modeControl.selectedSegmentIndex = 1
        }
        else if !(defaults.bool(forKey: "darkModeEnabled")){
            overrideUserInterfaceStyle = .light
            print("dark mode not enabled")
            modeControl.selectedSegmentIndex = 0
        }
        
        //if(defaults.bool(forKey: "update tip")){
            tipField1.text = defaults.string(forKey: "tip 1 value")
            tipField2.text = defaults.string(forKey: "tip 2 value")
            tipField3.text = defaults.string(forKey: "tip 3 value")
            print("default segment title synch 3")
        //}
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func modeController(_ sender: UISegmentedControl) {
        let mode = Int(modeControl.selectedSegmentIndex)
        if (mode == 0){
            defaults.set(false, forKey: "darkModeEnabled")
            overrideUserInterfaceStyle = .light
        }
        else if( mode == 1){
            defaults.set(true, forKey: "darkModeEnabled")
            overrideUserInterfaceStyle = .dark
        }
        defaults.synchronize()
        
    }
    
    @IBAction func tip1Update(_ sender: UITextField) {
        let tip1Control = tipField1.text
        //tip1Control = tip1Control! + "%"
        defaults.set(tip1Control, forKey: "tip 1 value")
        defaults.set(true, forKey: "update tip")
        defaults.synchronize()
    }
    
     @IBAction func tip2Update(_ sender: UITextField) {
         let tip2Control = tipField2.text
         //tip2Control = tip2Control! + "%"
         defaults.set(tip2Control, forKey: "tip 2 value")
         defaults.set(true, forKey: "update tip")
 
         defaults.synchronize()
     }
    
    
    
    @IBAction func tip3Update(_ sender: UITextField) {
        let tip3Control = tipField3.text
        //tip3Control = tip3Control! + "%"
        defaults.set(tip3Control, forKey: "tip 3 value")
        defaults.synchronize()
        defaults.set(true, forKey: "update tip")
        defaults.synchronize()
    }
    
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
