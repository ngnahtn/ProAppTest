//
//  DataSource.swift
//  ProAppWeek4
//
//  Created by admin on 07/11/2021.
//

import Foundation


// Giá trị phần mềm
class ProductValue {
    var Evalue: Double
    var Pvalue: Double
    var Hvalue: Double
    
    init(e: Double, p: Double, h: Double) {
        self.Evalue = e
        self.Pvalue = p
        self.Hvalue = h
    }
    
    func handleProductValue() -> Double {
        let G = 1.4 * Double(Evalue) * Double(Pvalue) * Double(Hvalue)
        return G
    }
}

// Gia tri no luc thuc te (E)
struct EValue {
    var TAW: Double
    var TBF: Double
    var TFW: Double
    var EFW: Double
    
    mutating func handleEFValue() -> Double {
        let ef = 1.4+(-0.03 * EFW)
        return ef
    }
    
    mutating func handleTCFValue() -> Double {
        let tcf = 0.6 + (0.01*TFW)
        return tcf
    }
    
    mutating func handleUUCPValue() -> Double{
        let uucp = TAW + TBF
        return uucp
    }
    
    mutating func handleEValue() -> Double {
        let aUCP = handleEFValue() * handleTCFValue() * handleUUCPValue()
        let E = 10/6 * aUCP
        return E
    }
    init(efw: Double, tfw: Double, tbf: Double, taw: Double ) {
        self.EFW = efw
        self.TFW = tfw
        self.TBF = tbf
        self.TAW = taw
    }
}


// Muc luong lao dong binh quan(H)

struct HValue {
    var gNC : Double
    var f1: Double
    var f2: Double
    
    mutating func handleFvalue() -> Double {
        return f1 + f2
    }
    
    mutating func handleHValue() -> Double {
        return gNC*(1 + handleFvalue())
    }
}
