//
//  EditTransaction.swift
//  Xpense
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

import SwiftWeb
import XpenseModel
import CoreLocation

struct EditTransaction: View {
    typealias XPTransaction = XpenseModel.Transaction

    // MARK: Stored Instance Properties
    /// The model from which to read the transaction
    private var model: Model = Model() // @EnvironmentObject
    /// Indication whether the view is currently being presented
//    @Environment(\.presentationMode) private var presentationMode

    /// The transaction's id
    @State var id: XPTransaction.ID?
    /// The transaction's properties' values (with default values for a new transaction)
    @State private var amount: Double = 0
    @State private var classification: XPTransaction.Classification = .income
    @State private var description: String = ""
    @State private var date = Date()
    @State private var selectedAccount: XpenseModel.Account.ID?

    // MARK: Computed Instance Properties
    var body: some View {
        Form {
            EditAmount(amount: $amount, classification: $classification)

            Section(header: Text("Description")) {
                TextField("Description", text: $description)
            }

            Section(header: Text("Account")) {
                List(model.accounts, id: \.self) { account in
                    HStack {
                        Text("\(account.name)")
                        Spacer()
//                        if self.selectedAccount == account.id {
//                            Image(systemName: "checkmark")
//                        }
                    }.onTapGesture {
                        self.selectedAccount = account.id
                    }
                }
            }

//            Section(header: Text("Date")) {
//                DatePicker(selection: $date, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
//                    Text("Date")
//                }
//            }
        }
//        .onAppear(perform: updateStates)
//            .navigationBarTitle(id == nil ? "Create Transaction" : "Edit Transaction", displayMode: .inline)
//            .navigationBarItems(trailing: saveButton)
    }

    /// A button to save the transaction
    private var saveButton: some View {
        Button(action: save) {
            Text("Save").bold()
        }.disabled(selectedAccount == nil || description.isEmpty || amount == 0)
    }

    // MARK: Private Instance Methods
    /// Updates the view's state
    private func updateStates() {
        guard let transaction = model.transaction(id) else {
            self.selectedAccount = model.accounts.first?.id
            self.amount = 0
            self.classification = Transaction.Classification.income
            self.description = ""
            self.date = Date()

            return
        }
        /// Fill attributes from existing transaction
        self.amount = Double(abs(transaction.amount))
        self.classification = transaction.classification
        self.description = transaction.description
        self.date = transaction.date
        self.selectedAccount = transaction.account
    }

    /// Save the transaction
    private func save() {
        guard let selectedAccount = selectedAccount else {
            return
        }

        let transaction = Transaction(id: self.id,
                                      amount: Cent(amount) * classification.factor,
                                      description: self.description,
                                      date: self.date,
                                      location: model.transaction(id)?.location,
                                      account: selectedAccount)
        self.model.save(transaction)
        updateStates()

        //self.presentationMode.wrappedValue.dismiss()
    }
}

//struct EditTransaction_Previews: PreviewProvider {
//    static let model = Model.mock
//
//    static var previews: some View {
//        NavigationView {
//            EditTransaction(id: model.transactions[0].id)
//                .navigationBarTitle("Transaction Editor")
//        }
////        .environmentObject(model)
//    }
//}
