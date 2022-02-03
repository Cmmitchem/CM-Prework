//
//  ViewController.swift
//  CMPrework
//
//  Created by Caroline Mitchem on 2/2/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    let defaults = UserDefaults.standard
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        
        
        tipControl.setTitle("15%", forSegmentAt: 0)
        tipControl.setTitle("18%", forSegmentAt: 1)
        tipControl.setTitle("20%", forSegmentAt: 2)
        
        defaults.set(tipControl.titleForSegment(at:0)?.replacingOccurrences(of: "%", with: "",  options: NSString.CompareOptions.literal, range: nil), forKey: "tip 1 value")
        defaults.set(tipControl.titleForSegment(at:1)?.replacingOccurrences(of: "%", with: "",  options: NSString.CompareOptions.literal, range: nil), forKey: "tip 2 value")
        defaults.set(tipControl.titleForSegment(at:2)?.replacingOccurrences(of: "%", with: "",  options: NSString.CompareOptions.literal, range: nil), forKey: "tip 3 value")
        
        defaults.synchronize()
        print("default segment title synch 1")
        billTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        if(defaults.bool(forKey: "darkModeEnabled")){
            overrideUserInterfaceStyle = .dark
            print("dark mode enabled")
        }
        else if !(defaults.bool(forKey: "darkModeEnabled")){
            overrideUserInterfaceStyle = .light
            print("dark mode not enabled")
        }
        
        if(defaults.bool(forKey: "update tip")){
            var tip1Title = defaults.string(forKey: "tip 1 value")
            tip1Title = tip1Title! + "%"
            tipControl.setTitle(tip1Title, forSegmentAt: 0)
            let tip1percent = defaults.string(forKey: "tip 1 value")
//            tip1percent = tip1percent?.replacingOccurrences(of: "%", with: "",  options: NSString.CompareOptions.literal, range: nil)
            defaults.set(tip1percent, forKey: "tip 1 percent")
            
            var tip2Title = defaults.string(forKey: "tip 2 value")
            tip2Title = tip2Title! + "%"
            tipControl.setTitle(tip2Title, forSegmentAt: 1)
            let tip2percent = defaults.string(forKey: "tip 2 value")
//            tip2percent = tip2percent?.replacingOccurrences(of: "%", with: "",  options: NSString.CompareOptions.literal, range: nil)
            defaults.set(tip2percent, forKey: "tip 2 percent")
            
            var tip3Title = defaults.string(forKey: "tip 3 value")
            tip3Title = tip3Title! + "%"
            tipControl.setTitle(tip3Title, forSegmentAt: 2)
            let tip3percent = defaults.string(forKey: "tip 3 value")
//            tip3percent = tip3percent?.replacingOccurrences(of: "%", with: "",  options: NSString.CompareOptions.literal, range: nil)
            defaults.set(tip3percent, forKey: "tip 3 percent")

            print("default segment title synch 2")
        }
        
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
    
    @IBAction func segmentedControl(_ sender: Any) {
        let bill = Double(billTextField.text!) ?? 0
        var dt1p = Double(defaults.string(forKey: "tip 1 percent")!) ?? 0
        dt1p = dt1p / 100
        
        var dt2p = Double(defaults.string(forKey: "tip 2 percent")!) ?? 0
        dt2p = dt2p / 100
        
        var dt3p = Double(defaults.string(forKey: "tip 3 percent")!) ?? 0
        dt3p = dt3p / 100
        
        let tipPercentages = [dt1p,dt2p,dt3p]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipField.text = String(format: "$%.2f", tip)
        totalField.text = String(format: "$%.2f", total)
    }
    

    
//    + (NSSet * )keyPathsForValuesAffectingValueForKey:(NSString *)key {
//
//        NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
//
//        if ([key isEqualToString:@"fullName"]) {
//            NSArray *affectingKeys = @[@"lastName", @"firstName"];
//            keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
//        }
//        return keyPaths;
//    }
    
}

