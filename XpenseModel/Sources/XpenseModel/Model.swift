//
//  Model.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

import Foundation
import Combine

// MARK: - Model
/// Contains all persistent data and handles storing and loading.
public class Model {
    
    // MARK: Stored Instance Properties
     @Published public private(set) var accounts: [Account] {
         didSet {
             accounts.saveToFile()
         }
     }
     @Published public private(set) var transactions: [Transaction] {
        didSet {
            transactions.saveToFile()
        }
    }
    
    // MARK: Initializer
    public init(accounts: [Account]? = nil, transactions: [Transaction]? = nil) {
        self.accounts = accounts ?? Account.loadFromFile()
        self.transactions = transactions ?? Transaction.loadFromFile()
    }
    
    // MARK: Instance Methods
    /**
     Get an account for a specific ID
     - parameters:
        - id: The id of the account you wish to find.
     - returns: The corresponding account if there exists one with the specified id, otherwise nil
     */
    public func account(_ id: Account.ID?) -> Account? {
        accounts.first(where: { $0.id == id })
    }
    
    /**
    Get a transaction for a specific ID
    - parameters:
       - id: The id of the transaction you wish to find.
    - returns: The corresponding transaction if there exists one with the specified id, otherwise nil
    */
    public func transaction(_ id: Transaction.ID?) -> Transaction? {
        transactions.first(where: { $0.id == id })
    }
    
    /**
    Save a specified account.
    - parameters:
       - account: The account you wish to save.
    */
    public func save(_ account: Account) {
        delete(account: account.id)
        accounts.append(account)
        accounts.sort()
    }
    
    /**
    Save a specified transaction.
    - parameters:
       - transaction: The transaction you wish to save.
    */
    public func save(_ transaction: Transaction) {
        delete(transaction: transaction.id)
        transactions.append(transaction)
        transactions.sort()
    }
    
    /**
    Delete a specified account and all transactions associated with the account.
    - parameters:
       - account: The transaction you wish to delete.
    */
    public func delete(account id: Account.ID) {
        accounts.removeAll(where: { $0.id == id })
        transactions.removeAll(where: { $0.account == id })
    }
    
    /**
    Delete a specified transaction.
    - parameters:
       - transaction: The transaction you wish to delete.
    */
    public func delete(transaction id: Transaction.ID) {
        transactions.removeAll(where: { $0.id == id })
    }
}

// MARK: Extension: Model: ObservableObject
extension Model: ObservableObject { }

// MARK: Extension: Model
#if DEBUG
extension Model {
    
    // MARK: Stored Type Properties
    /**
     Mock data to enable working with the preview.
     */
    public static var mock: Model {
        let paulsWallet = Account(name: "Paul's Wallet")
        let dorasWallet = Account(name: "Sparkasse")
        
        // Create a model with data
        let mock = Model(accounts: [
            paulsWallet,
            dorasWallet
        ], transactions: [
            Transaction(amount: -120,
                        description: "Brezn",
                        date: date(minutesFromNow: -15),
                        location: Coordinate(48.262432, 11.667976),
                        account: paulsWallet.id),
            Transaction(amount: -180,
                        description: "Spezi",
                        date: date(minutesFromNow: -45),
                        location: Coordinate(48.262432, 11.667976),
                        account: paulsWallet.id),
            Transaction(amount: -234565,
                        description: "MacBook Pro",
                        date: date(minutesFromNow: -50000),
                        location: Coordinate(48.262432, 11.667976),
                        account: paulsWallet.id),
            Transaction(amount: 98000,
                        description: "Salary",
                        date: date(minutesFromNow: -76400),
                        location: Coordinate(48.262432, 11.667976),
                        account: paulsWallet.id)
        ])
        
        mock.accounts.sort()
        mock.transactions.sort()
        
        return mock
    }
    
    // MARK: Private Type Methods
    /**
     Create a new date a certain amount of minutes from now.
     - parameters:
        - minutesFromNow: The amount of minutes the event shall be in the future.
     - returns: Date object representing the date in the future
     */
    private static func date(minutesFromNow minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: Date()) ?? Date()
    }
}
#endif
