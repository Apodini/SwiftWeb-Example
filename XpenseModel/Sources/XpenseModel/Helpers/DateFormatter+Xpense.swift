//
//  DateFormatter+Xpense.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

// MARK: Imports
import Foundation

// MARK: - Extension: DateFormatter
extension DateFormatter {
    
    // MARK: Computed Type Properties
    /**
    Formatter that includes the date as well as the time.
     
    Example: September 3, 2018 at 3:38 PM
    */
    public static let dateAndTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .long
        return dateFormatter
    }()
    
    /**
    Formatter that includes only the date.
     
    Example: 9/3/18
    */
    public static let onlyDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
}
