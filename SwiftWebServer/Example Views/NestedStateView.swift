//
//  NestedStateView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 18.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct NestedStateView: View {
    @State var isDarkModeEnabled = false
    
    var body: some View {
        VStack {
            Counter()
            
            Button("Toggle Dark Mode") {
                self.isDarkModeEnabled = !self.isDarkModeEnabled
            }
        }
        .background(isDarkModeEnabled ? Color.black : Color.white)
    }
}
