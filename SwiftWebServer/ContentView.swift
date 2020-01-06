//
//  ContentView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import SwiftWeb

struct ContentView: View {
    var body: View? {
        VStack(spacing: 20, alignment: .stretch) {
            TabBar()

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Transactions").font(.system(size: 35, weight: .bold))
                        Color.clear
                    }.frame(width: 698)
                    
                    Image(name: "plus.png")
                        .resizable()
                        .frame(width: 21, height: 23)
                }

                Spacer()
            }
        }
    }
}
