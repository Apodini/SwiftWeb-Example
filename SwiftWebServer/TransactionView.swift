//
//  TransactionView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct TransactionView: View {
    let listItems = ["Transaction 1", "Transaction 2", "Transaction 3", "Transaction 4"]

    var body: some View {
        VStack(spacing: 20) {
            TabBar()

            VStack {
                VStack(spacing: 20) {
                    HStack {
                        NavigationBarTitle("Transactions")
                        
                        Spacer()

                        Image("plus.png")
                            .resizable()
                            .frame(width: 21, height: 23)
                    }
                    .frame(width: 698)

//                    List(listItems) { item in
//                        VStack(alignment: .leading, spacing: 2.0) {
//                            Spacer()
//                            Text(item)
//                                .font(.system(size: 20, weight: .bold))
//                            Text("November 1, 2019 at 1:37 PM")
//                                .font(.system(size: 14, weight: .regular))
//                                .foregroundColor(Color(white: 0.55))
//                            Spacer()
//                        }
//                            .frame(height: 60)
//                    }
//                        .frame(width: 698)
                    
                    List {
                        Text("A")
                        Text("B")

                        ForEach([1, 2, 3]) {
                            Text(String(describing: $0))
                        }
                    }
                        .frame(width: 698)
                }
            }
        }
    }
}
