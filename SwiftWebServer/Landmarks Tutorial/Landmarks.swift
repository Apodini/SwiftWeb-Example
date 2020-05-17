//
//  Landmarks.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 15.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct Landmarks: View {
    var body: some View {
        VStack(spacing: 20) {
            CircleImage()
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack(alignment: .leading) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding(20)
    }
}


