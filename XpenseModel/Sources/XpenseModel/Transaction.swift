//
//  Transaction.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: - Cent
public typealias Cent = Int

// MARK: - Transaction
/// Represents a single transaction
public struct Transaction {
    
    // MARK: Classification
    /// Classifies transactions into Income or Expense regardless of how this is indicated.
    public enum Classification: String, CaseIterable, Identifiable {
        // MARK: Stored Instance Properties
        public var id: String {
            self.rawValue
        }
        
        public var factor: Int {
            self == .income ? 1 : -1
        }
        
        public var sign: String {
            self == .income ? "" : "-"
        }
        
        case expense = "Expense"
        case income = "Income"
        
        // MARK: Initializers
        public init(_ amount: Cent) {
            self = amount < 0 ? .expense : .income
        }
    }
    
    // MARK: Stored Instance Properties
    /// Unique ID of transaction
    public var id: UUID
    /// The amount of money this transaction is worth in cents
    public var amount: Cent
    /// A textual description
    public var description: String
    /// The date this transaction was executed
    public var date: Date
    /// The location of the transaction was executed from
    public var location: Coordinate?
    /// The account this transaction is linked to
    public var account: Account.ID
    
    // MARK: Computed Instance Properties
    /// Converts this transaction's amount into a textual representation
    public var amountDescription: String {
        return NumberFormatter.currencyRepresentation(from: amount) ?? ""
    }
    
    /// Converts this transaction's date into a textual representation
    public var dateDescription: String {
        return DateFormatter.dateAndTime.string(from: date)
    }
    
    /**
     Convert's this transaction's date into a relative description
     
     Example: 45 minutes ago
     */
    public var relativeDateDescription: String {
        if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff < 24 {
            return RelativeDateTimeFormatter.namedAndSpelledOut.localizedString(for: date, relativeTo: Date())
        }
        
        return DateFormatter.onlyDate.string(from: date)
    }
    
    /// This transaction's location stored as a 2D Coordinate.
    public var locationCoordinate: CLLocationCoordinate2D? {
        guard let latitude = location?.latitude, let longitude = location?.longitude else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    /// This transaction's classification into expense or income
    public var classification: Classification {
        Classification(amount)
    }
    
    // MARK: Initializers
    /**
     - parameters:
        - id: The transaction's unique id. New id is generated if non is provided.
        - amount: This transaction's monetary amount in cents
        - description: A textual description of the transaction
        - date: The transaction's execution date. If non is provided the current date is assumed.
        - location: The transaction's location of execution. If non is provided, the current location is assumed.
        - account: The account this transaction belongs to.
     */
    public init(id: UUID? = nil, amount: Cent, description: String, date: Date? = nil, location: Coordinate? = nil, account: Account.ID) {
        self.id = id ?? UUID()
        self.amount = amount
        self.description = description
        self.date = date ?? Date()
        self.location = location
        self.account = account
    }
}

// MARK: - Extension: Identifiable
extension Transaction: Identifiable { }


// MARK: - Extension: Comparable
extension Transaction: Comparable {
    public static func < (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.date > rhs.date
    }
}

// MARK: - Extension: Hashable
extension Transaction: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Extension: Equatable
extension Transaction: Equatable {
    public static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Extension: Codable
extension Transaction: Codable { }

// MARK: - Extension: LocalFileStorable
extension Transaction: LocalFileStorable {
    static var fileName = "Transactions"
}
