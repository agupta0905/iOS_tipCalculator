//
//  ViewController.swift
//  tipcalculator
//
//  Created by Ashu Gupta on 12/12/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!
    var Y_OFFSET: CGFloat = 150
    var hiddenFlag=false
    var currencySymbol = "$"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let locale = NSLocale.currentLocale()
        currencySymbol = locale.objectForKey(NSLocaleCurrencySymbol) as! String
        tipLabel.text = currencySymbol + "0.00"
        totalLabel.text = currencySymbol+"0.00"
        billField.text = currencySymbol
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercentageIdx = defaults.integerForKey("defaultTipPercentageIdx")
        tipControl.selectedSegmentIndex=defaultTipPercentageIdx
        OnEditingChanged(self)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setHidden(value: Bool){
        tipLabel.hidden = value
        totalLabel.hidden = value
        blackView.hidden = value
        tipControl.hidden = value
        plusLabel.hidden = value
        equalLabel.hidden = value
    }
    func adjustBillField(offset: CGFloat){
        var newRect = billField.frame
        newRect.origin.y = newRect.origin.y+offset
        billField.frame = newRect
    }
    @IBAction func OnEditingChanged(sender: AnyObject) {
        if(billField.text == "" || billField.text == currencySymbol){
            billField.text = currencySymbol
            if(hiddenFlag != true){
                hiddenFlag = true
                setHidden(hiddenFlag)
                adjustBillField(Y_OFFSET)
            }
        }
        else{
            billField.text = billField.text!.stringByReplacingOccurrencesOfString(currencySymbol, withString: "")
            var tipPercentages = [0.10, 0.15, 0.18]
            var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            var billAmount=NSString(string: billField.text!).doubleValue
            var tip = billAmount * tipPercentage
            var total = tip + billAmount
            tipLabel.text = String(format: currencySymbol+"%.2f",tip)
            totalLabel.text = String(format: currencySymbol+"%.2f",total)
            if(hiddenFlag != false)
            {
                hiddenFlag = false
                setHidden(hiddenFlag)
                adjustBillField(-1 * Y_OFFSET)
            }
        }
    }
}
