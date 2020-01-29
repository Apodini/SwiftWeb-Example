//
//  Picker.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 29.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct Picker<Label, SelectionValue, Content>: View where Label: View, SelectionValue: Hashable, Content: View  {
    let content: Content
    
    init<S>(_ title: S, selection: SelectionValue, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}
