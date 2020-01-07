//
//  TransactionView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import SwiftWeb

struct TransactionView: View {
    let listItems = ["Transaction 1", "Transaction 2", "Transaction 3", "Transaction 4"]
    
    var body: View? {
        VStack(spacing: 20, alignment: .stretch) {
            TabBar()

            VStack {
                VStack(spacing: 20, alignment: .stretch) {
                    HStack {
                        VStack(alignment: .leading) {
                            NavigationBarTitle("Transactions")
                            Color.clear
                        }
                        
                        Spacer()
                        
                        Image(name: "plus.png")
                            .resizable()
                            .frame(width: 21, height: 23)
                    }
                    .frame(width: 698)
                    
                    List(listItems) { item in
                        VStack(spacing: 2.0, alignment: .leading) {
                            Text(item)
                                .font(.system(size: 20, weight: .bold))
                            Text("November 1, 2019 at 1:37 PM")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color(white: 0.55))
                        }.frame(height: 60)
                    }
                }

                Spacer()
            }
        }
    }
}
