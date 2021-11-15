//
//  TBFViewController.swift
//  ProAppWeek4
//
//  Created by admin on 15/11/2021.
//

import UIKit

class TBFViewController: UIViewController {
    @IBOutlet weak var Beasy: UITextField!
    @IBOutlet weak var Bmedium: UITextField!
    @IBOutlet weak var Bcomplex: UITextField!
    @IBOutlet weak var Measy: UITextField!
    @IBOutlet weak var Mmedium: UITextField!
    @IBOutlet weak var Mcomplex: UITextField!
    @IBOutlet weak var Teasy: UITextField!
    @IBOutlet weak var Tmedium: UITextField!
    @IBOutlet weak var Tcomplex: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TBF Calculation"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleNext))
        self.navigationItem.rightBarButtonItem = add
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBAction func handleCalculate(_ sender: Any) {
        let Beasy = Double(Beasy.text!) ?? 0
        let Bmedium = Double(Bmedium.text!) ?? 0
        let Bcomplex = Double(Bcomplex.text!) ?? 0
        let Measy = Double(Measy.text!) ?? 0
        let Mmedium = Double(Mmedium.text!) ?? 0
        let Mcomplex = Double(Mcomplex.text!) ?? 0
        let Teasy = Double(Teasy.text!) ?? 0
        let Tmedium = Double(Tmedium.text!) ?? 0
        let Tcomplex = Double(Tcomplex.text!) ?? 0
        let TBF = calculate_TBF(b_don_gian: Double(Beasy), b_trung_binh: Double(Bmedium), b_phuc_tap: Double(Bcomplex), m_don_gian: Double(Measy), m_trung_binh: Double(Mmedium), m_phuc_tap: Double(Mcomplex), T_don_gian: Teasy, T_trung_binh: Tmedium, T_phuc_tap: Tcomplex)
        let value = TBF.calculate_TBF()
        self.navigationItem.title = "TBF: \(value)"
        UserDefaults.standard.set("\(value)", forKey: "TBF")
        
    }
    
    @objc func handleNext() {
        let vc = TFWViewController(nibName: "TFWViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TBFViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
