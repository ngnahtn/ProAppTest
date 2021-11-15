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
    
    mutating func handleFvalue() -> Double {
        return gNC / f1
    }
    
    mutating func handleHValue() -> Double {
        return handleFvalue() / 160
    }
}

// TAW
class calculate_TAW {
    var don_gian = Int()
    var trung_binh = Int()
    var phuc_tap = Int()
    
    init(n_don_gian: Int, n_trung_binh: Int, n_phuc_tap: Int) {
        self.don_gian = n_don_gian
        self.trung_binh = n_trung_binh
        self.phuc_tap = n_phuc_tap
    }
    
    func calculate_TAW() -> Int {
        return (self.don_gian * 1) + (self.trung_binh * 2) + (self.phuc_tap * 3)
    }
}

// TBF
class calculate_TBF {
    var b_don_gian = Double()
    var b_trung_binh = Double()
    var b_phuc_tap = Double()
    var m_don_gian = Double()
    var m_trung_binh = Double()
    var m_phuc_tap = Double()
    var T_don_gian = Double()
    var T_trung_binh = Double()
    var T_phuc_tap = Double()
    
    init(b_don_gian : Double,b_trung_binh : Double,b_phuc_tap : Double,
    m_don_gian : Double,m_trung_binh : Double,m_phuc_tap : Double,
         T_don_gian :Double, T_trung_binh :Double, T_phuc_tap :Double) {
        self.b_don_gian = b_don_gian
        self.b_trung_binh = b_trung_binh
        self.b_phuc_tap = b_phuc_tap
        
        self.m_don_gian = m_don_gian
        self.m_trung_binh = m_trung_binh
        self.m_phuc_tap = m_phuc_tap
        
        self.T_don_gian = T_don_gian
        self.T_trung_binh = T_trung_binh
        self.T_phuc_tap = T_phuc_tap
    }
    
    
    func calculate_TBF() -> Double {
       return (self.b_don_gian * 5) + (self.b_trung_binh * 10) + (self.b_phuc_tap * 15) +
       (self.m_don_gian * 5 * 1.2) + (self.m_trung_binh * 10 * 1.2) + (self.m_phuc_tap * 15 * 1.2) +
       (self.T_don_gian * 5 * 1.5) + (self.T_trung_binh * 10 * 1.5) + (self.T_phuc_tap * 15 * 1.5)
    }
}

// TFW

class calculate_TFW {
    var ranking_value_1 : Double
    var ranking_value_2 : Double
    var ranking_value_3 : Double
    var ranking_value_4 : Double
    var ranking_value_5 : Double
    var ranking_value_6 : Double
    var ranking_value_7 : Double
    var ranking_value_8 : Double
    var ranking_value_9 : Double
    var ranking_value_10 : Double
    var ranking_value_11 : Double
    var ranking_value_12 : Double
    var ranking_value_13 : Double

    
    init(ranking_value_1 : Double,ranking_value_2 : Double,ranking_value_3 : Double,ranking_value_4 : Double,ranking_value_5 : Double,ranking_value_6 : Double,ranking_value_7 : Double,ranking_value_8 : Double, ranking_value_9 : Double,ranking_value_10 : Double,ranking_value_11 : Double,ranking_value_12 : Double,ranking_value_13 : Double
        ) {
        self.ranking_value_1 = ranking_value_1
        self.ranking_value_2 = ranking_value_2
        self.ranking_value_3 = ranking_value_3
        self.ranking_value_4 = ranking_value_4
        self.ranking_value_5 = ranking_value_5
        self.ranking_value_6 = ranking_value_6
        self.ranking_value_7 = ranking_value_7
        self.ranking_value_8 = ranking_value_8
        self.ranking_value_9 = ranking_value_9
        self.ranking_value_10 = ranking_value_10
        self.ranking_value_11 = ranking_value_11
        self.ranking_value_12 = ranking_value_12
        self.ranking_value_13 = ranking_value_13
    }
    
    func calculate_TFW() -> Double {
        return (ranking_value_1 * 2) +
        (ranking_value_2 * 1) +
        (ranking_value_3 * 1) +
        (ranking_value_4 * 1) +
        (ranking_value_5 * 1) +
        (ranking_value_6 * 0.5) +
        (ranking_value_7 * 0.5) +
        (ranking_value_8 * 2) +
        (ranking_value_9 * 1) +
        (ranking_value_10 * 1) +
        (ranking_value_11 * 1) +
        (ranking_value_12 * 1) +
        (ranking_value_13 * 1)
    }
}

// EFW
class calculate_EFW {
    var ranking_value_1 : Double
    var ranking_value_2 : Double
    var ranking_value_3 : Double
    var ranking_value_4 : Double
    var ranking_value_5 : Double
    var ranking_value_6 : Double
    var ranking_value_7 : Double
    var ranking_value_8 : Double


    init(ranking_value_1 : Double,ranking_value_2 : Double,ranking_value_3 : Double,ranking_value_4 : Double,ranking_value_5 : Double,ranking_value_6 : Double,ranking_value_7 : Double,ranking_value_8 : Double) {
        self.ranking_value_1 = ranking_value_1
        self.ranking_value_2 = ranking_value_2
        self.ranking_value_3 = ranking_value_3
        self.ranking_value_4 = ranking_value_4
        self.ranking_value_5 = ranking_value_5
        self.ranking_value_6 = ranking_value_6
        self.ranking_value_7 = ranking_value_7
        self.ranking_value_8 = ranking_value_8

    }

    func calculate_EFW() -> Double {
        return (ranking_value_1 * 1.5) +
        (ranking_value_2 * 0.5) +
        (ranking_value_3 * 1) +
        (ranking_value_4 * 0.5) +
        (ranking_value_5 * 1) +
        (ranking_value_6 * 2) -
        (ranking_value_7 * 1) -
        (ranking_value_8 * 1)
    }

    func check(value: Double) -> Double {
            if value <= 0 {
                return 0
            } else if value > 0 && value <= 1 {
                return 0.05
            } else if value > 1 && value <= 2 {
                return 0.1
            } else if value > 2 && value <= 3 {
                return 0.6
            } else {
                return 1
            }
        }
    func calculate_ES() -> Double {
        let ef = check(value: ranking_value_1 * 1.5) + check(value: ranking_value_2 * 0.5) + check(value: ranking_value_3 * 1) + check(value: ranking_value_4 * 0.5) + check(value: ranking_value_5 * 1) + check(value: ranking_value_6 * 2)
        return ef
    }

    func checkPValue() -> Double {
        let ef = self.calculate_ES()
        if ef <= 1 {
            return 48
        } else if ef >= 1 && ef < 3 {
            return 32
        } else {
            return 20
        }
    }
}

