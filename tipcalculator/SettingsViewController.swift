//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Ashu Gupta on 12/13/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaltTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercentageIdx = defaults.integerForKey("defaultTipPercentageIdx")
        defaltTipControl.selectedSegmentIndex=defaultTipPercentageIdx
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaltTipControl.selectedSegmentIndex, forKey: "defaultTipPercentageIdx")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
