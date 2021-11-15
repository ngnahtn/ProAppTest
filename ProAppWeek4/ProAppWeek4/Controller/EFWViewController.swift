//
//  EFWViewController.swift
//  ProAppWeek4
//
//  Created by admin on 15/11/2021.
//

import UIKit

class EFWViewController: UIViewController {
    @IBOutlet weak var value1: UITextField!
    @IBOutlet weak var value2: UITextField!
    @IBOutlet weak var value3: UITextField!
    @IBOutlet weak var value4: UITextField!
    @IBOutlet weak var value5: UITextField!
    @IBOutlet weak var value6: UITextField!
    @IBOutlet weak var value7: UITextField!
    @IBOutlet weak var value8: UITextField!
    @IBOutlet weak var esLabel: UILabel!
    @IBOutlet weak var efLabel: UILabel!
    @IBOutlet weak var p: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "EFW Calculation"
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
        
        let EFW = calculate_EFW(ranking_value_1: value1, ranking_value_2: value2, ranking_value_3: value3, ranking_value_4: value4, ranking_value_5: value5, ranking_value_6: value6, ranking_value_7: value7, ranking_value_8: value8)
        let value = EFW.calculate_EFW()
        let es = EFW.calculate_ES()
        let pvalue = EFW.checkPValue()
        let ef: Double = 1.4 + (-0.03 * value)
        esLabel.text = "ES: \(es)"
        efLabel.text = "EF: \(ef)"
        p.text = "P: \(pvalue)"
        self.navigationItem.title = "EFW: \(value)"
        UserDefaults.standard.set("\(value)", forKey: "EFW")
        UserDefaults.standard.set("\(pvalue)", forKey: "P")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}

extension EFWViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    

