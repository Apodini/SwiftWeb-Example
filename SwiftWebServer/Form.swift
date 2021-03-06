//
//  Form.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 28.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import SwiftWeb

struct Form<Content>: View where Content: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
            .padding(.bottom, 20)
            .background(Color(red:0.95, green:0.95, blue:0.97, alpha:1.0))
    }
}
