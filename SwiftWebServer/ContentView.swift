//
//  ContentView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import SwiftWeb

struct ContentView: View {
    
    var body: some View {
        TabView(selection: 1) {
            Text("AllAccountsView")
                .tabItem {
                    Text("Accounts")
                    Image("rectangle.stack.png")
            }
            
            TransactionView()
                .sheet(isPresented: false) {
                    EditTransactionView()
            }.tabItem {
                Text("Transactions")
                Image("list.dash.png")
            }
        }
    }
}
