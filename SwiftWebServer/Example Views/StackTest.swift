//
//  StackTest.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 18.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct StackTest: View { // set of growing axes at each level:
    var body: some View {
        HStack {                             // [vertical, horizontal]
            VStack {                         // [vertical, horizontal]
                Text("Hello, World!")        // []
                Spacer()                     // [undetermined]
                    .padding()               // [undetermined]
                    .border(Color.red)       // [undetermined]
                    .padding()               // [undetermined]
                    .border(Color.blue)      // [undetermined]
                
                HStack {                     // [horizontal]
                    Spacer()             // [undetermined]
                        .padding()           // [undetermined]
                        .border(Color.green) // [undetermined]
                }
            }
                .border(Color.gray)              // [vertical, horizontal]
        }
    }
}
