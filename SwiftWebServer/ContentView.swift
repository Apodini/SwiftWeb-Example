//
//  ContentView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct ContentView: View {
    
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

struct Counter: View {
    @State var counter = 0

    func action() {
        counter += 1
    }
    
    var body: some View {
        return Text(String(describing: counter)).onTapGesture {
            self.action()
        }
    }
}
