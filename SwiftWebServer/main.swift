//
//  main.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb
import Swifter

let server = HttpServer()

server["/"] = { request in
    return HttpResponse.ok(.text(SwiftWeb.render(view: ContentView())))
}

let semaphore = DispatchSemaphore(value: 0)

do {
  try server.start(8080)
  print("listening on port \(try server.port())")
  semaphore.wait()
} catch {
  print("error: \(error)")
  semaphore.signal()
}
