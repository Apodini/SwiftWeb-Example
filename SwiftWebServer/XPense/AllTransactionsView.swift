//
//  TransactionView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct AllTransactionsView: View {
    let listItems = ["Transaction 1", "Transaction 2", "Transaction 3", "Transaction 4"]
    
    @State var presentAddTransaction = false
    
    var body: some View {
        NavigationView {
            List(listItems, id: \.self) { item in
                VStack(alignment: .leading, spacing: 2.0) {
                    Spacer()
                    Text(item)
                        .font(.system(size: 20, weight: .bold))
                    Text("November 1, 2019 at 1:37 PM")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(white: 0.55))
                    Spacer()
                }
                .frame(height: 60)
            }
            .navigationBarTitle("Transactions")
            .navigationBarItems(trailing: Button("+", action: {
                self.presentAddTransaction = true
            }))
                .sheet(isPresented: $presentAddTransaction) {
                    EditTransactionView()
            }
        }.frame(width: 698)
    }
}
