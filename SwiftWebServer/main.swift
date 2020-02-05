//
//  main.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

let server = SwiftWebServer(contentView: ContentView(), path: #file)

let semaphore = DispatchSemaphore(value: 0)

do {
    try server.start()
    print("listening on port \(try server.port())")
    semaphore.wait()
} catch {
    print("error: \(error)")
    semaphore.signal()
}
