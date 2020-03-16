//
//  AllAccountsView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 18.02.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct AllAccountsView: View {
    let accounts: [(name: String, amount: String)] = [("Safe", "$2523.80"), ("Under my Pillow", "$2500000")]
    
    var body: some View {
//        ZStack {
//            Color(red:0.95, green:0.95, blue:0.96)
//            VStack {
//                NavigationView {
                    VStack(spacing: 26.0) {
                        ForEach(accounts) { item in
                            VStack(spacing: 10.0) {
                                Text(item.name).font(.system(size: 33))
                                Text(item.amount).font(.system(size: 50, weight: .bold, design: .rounded))
                            }
                            .padding(.vertical, 31)
                            .frame(width: 603)
                            .background(Color(white: 1.0))
                            .cornerRadius(14.0)
                        }
                    }.padding(.top, 30)
//                        .navigationBarTitle("Accounts")
//                }.frame(width: 698)
//            }
//        }
    }
}
