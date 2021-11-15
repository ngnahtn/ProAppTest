//
//  ProductCost.swift
//  ProAppWeek4
//
//  Created by admin on 15/11/2021.
//

import UIKit

class ProductCost: UIViewController {
    @IBOutlet weak var gValue: UILabel!
    @IBOutlet weak var tlValue: UILabel!
    
    @IBOutlet weak var costValue: UILabel!
    var gValueDouble: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let cValue = 0.65 * gValueDouble
        let tl = 0.06 * (cValue + gValueDouble)
        let cost = gValueDouble + cValue + tl
        gValue.text = "= 65% x G: \(cValue)"
        tlValue.text = "= 6% x (G + C): \(tl)"
        costValue.text = "\(cost)"
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
