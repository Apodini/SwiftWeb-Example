//
//  Account.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

// MARK: Imports
import Foundation

// MARK: - Account
/// Represents a single account that consists of a set of transactions.
public struct Account {
    // MARK: Stored Properties
    public var id: UUID
    public var name: String
    
    // MARK: Initializers
    public init(id: UUID? = nil, name: String) {
        self.id = id ?? UUID()
        self.name = name
    }
    
    // MARK: Instance Methods
    /**
     Finds all transactions that belong to this account.
     - parameters:
        - model: The model to read from
     - returns: All transactions in this account
     */
    public func transactions(_ model: Model) -> [Transaction] {
        model.transactions.filter({ $0.account == id })
    }
    
    /**
     Calculates the current balance on this account
     - parameters:
        - model: The model to read from
     - returns: The current balance of this account in cents
     */
    public func balance(_ model: Model) -> Cent {
        return transactions(model).reduce(0, { $0 + $1.amount })
    }
    
    /**
     Calculates the current balance on this account and converts it to a human-readable currency format.
     - parameters:
        - model: The model to read from
     - returns: The current balance of this account in a human readable form
     */
    public func balanceRepresentation(_ model: Model) -> String? {
        return NumberFormatter.currencyRepresentation(from: self.balance(model))
    }
}

// MARK: - Extension: CustomStringConvertible
extension Account: CustomStringConvertible {
    public var description: String {
        return name
    }
}


// MARK: - Extension: Equatable
extension Account: Equatable {
    public static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id
    }
}


// MARK: - Extension: Comparable
extension Account: Comparable {
    public static func < (lhs: Account, rhs: Account) -> Bool {
        return lhs.name < rhs.name
    }
}


// MARK: - Extension: Hashable
extension Account: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


// MARK: - Extension: Identifiable
extension Account: Identifiable { }


// MARK: - Extension: Codable
extension Account: Codable { }

// MARK: - Extension: LocalFileStorable
extension Account: LocalFileStorable {
    static var fileName = "Accounts"
}
