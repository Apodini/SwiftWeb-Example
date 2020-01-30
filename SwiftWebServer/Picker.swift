//
//  Picker.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 29.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

public struct Picker<Label, SelectionValue, Content>: View where Label: View, SelectionValue: Hashable, Content: View  {
    public typealias Body = Never
    
    let content: Content
    
    public init<S>(_ title: S, selection: SelectionValue, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.content = content()
    }
    
    public var html: HTMLNode {
        return .raw("")
    }
}
