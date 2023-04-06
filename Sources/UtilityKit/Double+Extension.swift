//
//  File.swift
//  
//
//  Created by Dongju on 2023/04/06.
//

import Foundation


extension Double {
    
    public func toDisplay(smallestUnit: String.Unit = .unit) -> String {
        if "\(Decimal(self) * 10000)".count > 16 {
            let numbers = "\(self)".components(separatedBy: ".")
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .none
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 0
            
            if numbers[1].toInt == 0 {
                let result = numberFormatter.string(for: (Decimal(self))) ?? ""
                return "\(Int64(result.toDouble * 10000))".spelloutCurrency(smallestUnit: .unit)
            }else{
                let result = numberFormatter.string(for: (Decimal(self) * 10000)) ?? ""
                return result.spelloutCurrency(smallestUnit: .unit)
                
            }
        } else {
            return "\(Decimal(self) * 10000)".spelloutCurrency(smallestUnit: .unit)
        }
        
        
    }
    
}
