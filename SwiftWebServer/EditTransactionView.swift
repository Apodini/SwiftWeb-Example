//
//  Sheet.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 07.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

public struct EditTransactionView: View {
    @State var transactionType: String = "Income"
    @State var description: String = ""
    
    public func html(forHTMLOfSubnodes htmlOfSubnodes: [HTMLNode]) -> HTMLNode {
        print("state while rendering in EditTransactionView: \(description)")
        return htmlOfSubnodes.joined()
    }
    
    public var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("Amount")) {
                        HStack {
                            Text("2 500 000")
                                .font(.system(size: 18))
                            
                            Spacer()
                            
                            Picker("Transaction Type", selection: $transactionType) {
                                ForEach(["Income", "Expense"]) { transactionType in
                                    Text(transactionType).tag(transactionType)
                                }
                            }
                        }.frame(height: 44)
                    }
                    
                    Section(header: Text("Description")) {
                        HStack {
//                            Text("Latest Heist")
//                                .font(.system(size: 18))
                            TextField("Description", text: $description)
                                .font(.system(size: 18))
                            
                            Spacer()
                        }.frame(height: 44)
                    }
                    
                    Section(header: Text("Account")) {
                        VStack {
                            HStack {
                                Text("Safe")
                                    .font(.system(size: 18))
                                
                                Spacer()
                            }
                                .frame(height: 44)
                            
                            Color(white: 0.83).frame(height: 0.5)
                            
                            HStack {
                                Text("Under my Pillow")
                                    .font(.system(size: 18))
                                
                                Spacer()
                                Image("checkmark.png").resizable().frame(width: 17, height: 17)
                            }.frame(height: 44)
                        }
                    }
                    
                    Section(header: Text("Date")) {
                        HStack {
                            Text("Date")
                                .font(.system(size: 18))
                            
                            Spacer()
                            
                            Text("11/1/19, 13:37 PM")
                                .font(.system(size: 18))
                                .foregroundColor(Color(red:0.54, green:0.54, blue:0.56))
                        }.frame(height: 44)
                    }
                }
                .navigationBarTitle("Create Transaction", displayMode: .inline)
            }
    }
}
