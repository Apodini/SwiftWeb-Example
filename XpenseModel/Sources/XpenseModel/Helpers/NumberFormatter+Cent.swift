//
//  NumberFormatter+Cent.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

// MARK: Imports
import Foundation

// MARK: - Extension: NumberFormatter
extension NumberFormatter {
    
    // MARK: Computed Type Properties
    /**
    Converts a cent-value to a readable currency value. The currency symbol is added depending on your locale.
     
    Example: 152345 -> $1,52
     */
    public static let currencyAmount: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.multiplier = 0.01
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    /**
     Converts a cent-value to a readable currency value without the currency symbol.
     
     Example: 152345 -> 1,52
     */
    public static let decimalAmount: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.multiplier = 0.01
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    // MARK: Type Methods
    /**
    Converts an amount of cents into it's corresponding currency representation.
     We use this method to minimize the number of times in our code where we convert a Double to an NSNumber.
    
    Example: 152345 -> $1,52
    - parameters:
       - cent: The amount in cents
    - returns: The amount converted into its currency representation if the conversion succeeded, otherwise nil
    */
    public static func currencyRepresentation(from cent: Cent) -> String? {
        currencyAmount.string(from: NSNumber(value: Double(cent)))
    }
}
