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
        VStack {
            Counter()
            Counter()
        }
    }
    
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

struct Counter: View, TypeErasedTapGestureView {
    @State var counter = 0
    @State var tapId = UUID()
    
    var tapGestureViewID: String {
        return tapId.uuidString
    }
    
    func action() {
        counter += 1
    }
    
    func html(forHTMLOfSubnodes htmlOfSubnodes: [HTMLNode]) -> HTMLNode {
        let htmlForDebugging: HTMLNode =
            .div(style: [.justifyContent: .center, .alignItems: .center]) {
                .div(style: [.flexGrow: .zero]) {
                    .raw(String(describing: counter))
                }
        }
        
        return htmlForDebugging.withCustomAttribute(
            key: "tap-id",
            value: tapGestureViewID
        )
    }
    
    var body: some View {
        return Text(String(describing: counter))
    }
}
