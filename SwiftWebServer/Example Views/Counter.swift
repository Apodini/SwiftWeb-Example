//
//  Counter.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 18.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct Counter: View {
    @State var counter = 0
    
    func action() {
        counter += 1
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(String(describing: counter))
        })
    }
}

