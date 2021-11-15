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
    
    @IBOutlet weak var GValueLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Product Value"
        let taw = UserDefaults.standard.string(forKey: "TAW") ?? ""
        let tbf = UserDefaults.standard.string(forKey: "TBF") ?? ""
        let tfw = UserDefaults.standard.string(forKey: "TFW") ?? ""
        let efw = UserDefaults.standard.string(forKey: "EFW") ?? ""
        let p = UserDefaults.standard.string(forKey: "P") ?? ""
        TAW.text = "\(taw)"
        TBF.text = "\(tbf)"
        TFW.text = "\(tfw)"
        EFW.text = "\(efw)"
        PValueTextField.text = "\(p)"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleNext))
        self.navigationItem.rightBarButtonItem = add
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @objc func handleNext() {
        if let pValue = PValueTextField.text {
            let GValue = ProductValue(e: Double(EValueLabel.text!) ?? 0, p: Double(pValue) ?? 0, h: Double(HValueLabel.text!) ?? 0)
            let vc = ProductCost(nibName: "ProductCost", bundle: nil)
            vc.gValueDouble = GValue.handleProductValue()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            return
        }
        
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
        var hValue = HValue(gNC: Double(gnc)!, f1: Double(f1)!)
        self.HValueLabel.text = "\(hValue.handleHValue())"
    }
    
    @IBAction func handleGButton(_ sender: UIButton) {
        let pValue = PValueTextField.text!
        let GValue = ProductValue(e: Double(EValueLabel.text!)!, p: Double(pValue)!, h: Double(HValueLabel.text!)!)
        let gdoubleValue = GValue.handleProductValue()
        let y = Double(round(10*gdoubleValue)/10)
        self.navigationItem.title = "Product Value: \(y)"
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

