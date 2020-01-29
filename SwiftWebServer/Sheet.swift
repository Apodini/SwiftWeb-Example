//
//  Sheet.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 07.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

public struct Sheet: View {
    public var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    Text("Create Transaction")
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                }
                .frame(height: 50)
                .background(Color(red:0.98, green:0.98, blue:0.99))
                
                Color(white: 0.73)
                    .frame(height: 0.5)
                
                Form {
                    Section(header: Text("Amount")) {
                        HStack {
                            Text("2 500 000")
                                .font(.system(size: 18))
                            
                            Spacer()
                            
                            HStack {
                                Text("Expense")
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 8)
                                Text("Income")
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(.horizontal, 37)
                                    .padding(.vertical, 5)
                                    .background(Color(white: 1.0))
                                    .cornerRadius(6)
                                    .shadow(color: Color.init(white: 0).opacity(0.24), radius: 5, x: 0, y: 2)
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, 3)
                            }
                            .background(Color(white: 0.93))
                            .cornerRadius(8)
                        }.frame(height: 44)
                    }
                    
                    Section(header: Text("Description")) {
                        HStack {
                            Text("Latest Heist")
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
                            }.frame(height: 44)
                            
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
            }
            .frame(width: 618.0)
            .cornerRadius(10.0)
            .shadow(color: Color(white: 0.0).opacity(0.25), radius: 129.0, x: 0.0, y: 2.0)
            
            Spacer()
        }
            .background(Color(white: 0.0).opacity(0.14))
    }
}
