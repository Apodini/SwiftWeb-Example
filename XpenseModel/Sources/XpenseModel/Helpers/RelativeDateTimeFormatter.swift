//
//  RelativeDateTimeFormatter.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

// MARK: Imports
import Foundation

// MARK: - Extension: RelativeDateTimeFormatter
extension RelativeDateTimeFormatter {
    
    // MARK: Computed Type Properties
    /**
     Gives a relative date description.
     
     Example: 45 minutes ago
     */
    static var namedAndSpelledOut: RelativeDateTimeFormatter {
        let relativeDateTimeFormatter = RelativeDateTimeFormatter()
        relativeDateTimeFormatter.dateTimeStyle = .named
        relativeDateTimeFormatter.unitsStyle = .full
        return relativeDateTimeFormatter
    }
}
