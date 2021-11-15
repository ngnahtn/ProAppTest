//
//  TFWViewController.swift
//  ProAppWeek4
//
//  Created by admin on 15/11/2021.
//

import UIKit

class TFWViewController: UIViewController {
    @IBOutlet weak var value1: UITextField!
    @IBOutlet weak var value2: UITextField!
    @IBOutlet weak var value3: UITextField!
    @IBOutlet weak var value4: UITextField!
    @IBOutlet weak var value5: UITextField!
    @IBOutlet weak var value6: UITextField!
    @IBOutlet weak var value7: UITextField!
    @IBOutlet weak var value8: UITextField!
    @IBOutlet weak var value9: UITextField!
    @IBOutlet weak var value10: UITextField!
    @IBOutlet weak var value11: UITextField!
    @IBOutlet weak var value12: UITextField!
    @IBOutlet weak var value13: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TFW Calculation"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleNext))
        self.navigationItem.rightBarButtonItem = add
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @objc func handleNext() {
        let value1 = Double(value1.text!) ?? 0
        let value2 = Double(value2.text!) ?? 0
        let value3 = Double(value3.text!) ?? 0
        let value4 = Double(value4.text!) ?? 0
        let value5 = Double(value5.text!) ?? 0
        let value6 = Double(value6.text!) ?? 0
        let value7 = Double(value7.text!) ?? 0
        let value8 = Double(value8.text!) ?? 0
        let value9 = Double(value9.text!) ?? 0
        let value10 = Double(value10.text!) ?? 0
        let value11 = Double(value11.text!) ?? 0
        let value12 = Double(value12.text!) ?? 0
        let value13 = Double(value13.text!) ?? 0
        
    
        let TFW = calculate_TFW(ranking_value_1: value1, ranking_value_2: value2, ranking_value_3: value3, ranking_value_4: value4, ranking_value_5: value5, ranking_value_6: value6, ranking_value_7: value7, ranking_value_8: value8, ranking_value_9: value9, ranking_value_10: value10, ranking_value_11: value11, ranking_value_12: value12, ranking_value_13: value13)
        let value = TFW.calculate_TFW()
        self.navigationItem.title = "TFW: \(value)"
        UserDefaults.standard.set("\(value)", forKey: "TFW")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
        let vc = EFWViewController(nibName: "EFWViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TFWViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

