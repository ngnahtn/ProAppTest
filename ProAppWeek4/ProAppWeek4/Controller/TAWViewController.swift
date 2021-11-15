//
//  TAWViewController.swift
//  ProAppWeek4
//
//  Created by admin on 15/11/2021.
//

import UIKit

class TAWViewController: UIViewController {
    @IBOutlet weak var easyTextField: UITextField!
    @IBOutlet weak var medium: UITextField!
    @IBOutlet weak var complex: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TAW Calculation"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleNext))
        self.navigationItem.rightBarButtonItem = add
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBAction func handleCalculateButton(_ sender: UIButton) {
        let easy = Int(easyTextField.text!) ?? 0
        let medium = Int(medium.text!) ?? 0
        let complex = Int(complex.text!) ?? 0
        let TAW = calculate_TAW(n_don_gian: easy, n_trung_binh: medium, n_phuc_tap: complex)
        let value = TAW.calculate_TAW()
        self.navigationItem.title = "TAW: \(value)"
        UserDefaults.standard.set("\(value)", forKey: "TAW")
    }
    @objc func handleNext() {
        let vc = TBFViewController(nibName: "TBFViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension TAWViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
