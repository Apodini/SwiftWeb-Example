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
    @State var string = "lel "
    
//    var body: some View {
//        VStack(spacing: 20) {
//            Counter()
//            Counter()
//            Text(string).onTapGesture {
//                self.string += "lel "
//            }
//        }
//    }
    
//    var body: some View {
//        TabView(selection: 1) {
//            Text("All Accounts View")
//                .tabItem {
//                    Text("Accounts")
//                    Image("rectangle.stack.png")
//            }
//
//            Text("All Transactions View")
//                .sheet(isPresented: true) {
//                    EditTransactionView()
//            }.tabItem {
//                Text("Transactions")
//                Image("list.dash.png")
//            }
//        }
//    }
    
//    var body: some View {
//        TabView(selection: 1) {
//            AllAccountsView()
//                .tabItem {
//                    Text("Accounts")
//                    Image("rectangle.stack.png")
//            }
//
//            AllTransactionsView()
//                .sheet(isPresented: true) {
//                    EditTransactionView()
//            }.tabItem {
//                Text("Transactions")
//                Image("list.dash.png")
//            }
//        }
//    }
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
