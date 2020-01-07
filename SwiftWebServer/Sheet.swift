//
//  Sheet.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 07.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation

import Foundation
import SwiftWeb

public struct Sheet: View {
    public var body: View? {
        VStack {
            Spacer()
            Color(red:0.95, green:0.95, blue:0.97, alpha:1.0)
                .frame(width: 300, height: 300)
                .cornerRadius(10.0)
                .shadow(color: Color(white: 0.0).opacity(0.25), radius: 129, x: 0, y: 2)
            Spacer()
        }
            .background(Color(white: 0.0).opacity(0.14))
    }
}
