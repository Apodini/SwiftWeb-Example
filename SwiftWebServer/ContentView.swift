//
//  ContentView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct ContentView: View, TypeErasedTapGestureView {
    var viewNode: ViewNode?
    
    var tapGestureViewID: String {
        viewNode?.state["tapGestureViewID"] as? String ?? ""
    }
    
    func action() {
        viewNode?.state["counter"] = (viewNode?.state["counter"] as? Int ?? -1) + 1
    }

    var initialState: [String : Any] {
        [
            "counter": 5,
            "tapGestureViewID": UUID().uuidString
        ]
    }
    
    var body: some View {
//        action = {
//            view.viewNode?.state["counter"] = (view.viewNode?.state["counter"] as? Int ?? 0) + 1
//            print(view.viewNode?.state["counter"])
//        }
        
        return Text(String(describing: viewNode?.state["counter"]))
    }
    
    public var html: HTMLNode {
        body.html.withCustomAttribute(
            key: "tap-id",
            value: tapGestureViewID
        )
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
