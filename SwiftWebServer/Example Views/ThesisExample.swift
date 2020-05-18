//
//  ThesisExample.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 18.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct ThesisExample: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("quirin.jpeg")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Quirin Schweigert")
                    .font(.title)
                
                Text("Author of the SwiftWeb Framework")
                    .font(.subheadline)
            }
        }
        .padding(20)
        .background(Color(white: 0.95))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(50)
    }
}
