//
//  XPense.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 18.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct XPense: View {
    var body: some View {
        TabView(selection: 1) {
            AllAccountsView()
                .tabItem {
                    Text("Accounts")
                    Image("rectangle.stack.png")
            }
            
            AllTransactionsView()
                .tabItem {
                    Text("Transactions")
                    Image("list.dash.png")
            }
        }
    }
}
