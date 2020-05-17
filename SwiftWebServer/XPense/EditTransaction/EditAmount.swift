//
//  EditAmount.swift
//  Xpense
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

import Foundation
import SwiftWeb
import XpenseModel

struct EditAmount: View {
    typealias Classification = XpenseModel.Transaction.Classification
    
    // MARK: Stored Instance Properties
    /// The transaction's amount
    @Binding var amount: Double
    /// The transction's classification
    @Binding var classification: Classification

    // MARK: Computed Instance Properties
    var body: some View {
        Section(header: Text("Amount")) {
            HStack {
                HStack(alignment: .center, spacing: 2) {
                    Text("\(classification.sign)")
                    TextField("Amount", value: $amount, formatter: NumberFormatter.decimalAmount)
                        .keyboardType(.decimalPad) // Show only numbers and a dot
                }
                
                Picker("Transaction Type", selection: $classification) {
                    ForEach(Classification.allCases) { transactionType in
                        Text(transactionType.rawValue).tag(transactionType)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}

//// MARK: - EditAmount_Previews
//struct EditAmount_Previews: PreviewProvider {
//    @State static var amount: Double = 120
//    @State static var classification = Transaction.Classification.income
//
//    static var previews: some View {
//        Form {
//            EditAmount(amount: $amount, classification: $classification)
//        }
//    }
//}
