//
//  ViewController.swift
//  ProAppWeek4
//
//  Created by admin on 07/11/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var EValueLabel: UILabel!
    
    @IBOutlet weak var HValueLabel: UILabel!
    @IBOutlet weak var PValueTextField: UITextField!
    @IBOutlet weak var EFW: UITextField!
    @IBOutlet weak var TFW: UITextField!
    @IBOutlet weak var TBF: UITextField!
    @IBOutlet weak var TAW: UITextField!
    
    @IBOutlet weak var gnc: UITextField!
    @IBOutlet weak var f1: UITextField!
    @IBOutlet weak var f2: UITextField!
    
    @IBOutlet weak var GValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Xac Dinh Chi Phi Phan Mem"
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBAction func handleEValueButton(_ sender: UIButton) {
        let efw = EFW.text!
        let tfw = TFW.text!
        let TBF = TBF.text!
        let TAW = TAW.text!
        var eValue = EValue(efw: Double(efw)!, tfw: Double(tfw)!, tbf: Double(TBF)!, taw: Double(TAW)!)
        self.EValueLabel.text = "\(eValue.handleEValue())"
    }
    
    @IBAction func handleHButton(_ sender: UIButton) {
        let gnc = gnc.text!
        let f1 = f1.text!
        let f2 = f2.text!
        var hValue = HValue(gNC: Double(gnc)!, f1: Double(f1)!, f2: Double(f2)!)
        self.HValueLabel.text = "\(hValue.handleHValue())"
    }
    
    @IBAction func handleGButton(_ sender: UIButton) {
        let pValue = PValueTextField.text!
        let GValue = ProductValue(e: Double(EValueLabel.text!)!, p: Double(pValue)!, h: Double(HValueLabel.text!)!)
        self.GValueLabel.text = "\(GValue.handleProductValue())"
    }
}

extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

