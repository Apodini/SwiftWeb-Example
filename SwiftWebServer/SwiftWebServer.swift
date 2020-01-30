//
//  SwiftWebServer.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 05.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb
import Swifter

class SwiftWebServer {
    static let port = 8080
    static let projectDirectoryName = "SwiftWebServer/"
    
    let server: HttpServer
    var staticFilesPath: String?

    init<ContentView>(contentView: ContentView) where ContentView: View {
        server = HttpServer()

        server["/"] = { request in
            return HttpResponse.ok(.text(SwiftWeb.render(view: contentView)))
        }

        server["/:path"] = { request in
            guard let fileName = request.path.components(separatedBy: "/").last,
                  let ressource = self.loadRessourceFile(name: fileName) else {
                    return HttpResponse.notFound
            }
            
            return HttpResponse.ok(.data(ressource))
        }
        
        staticFilesPath = getRessourceDirectoryPath()
    }
    
    func getRessourceDirectoryPath() -> String? {
        let filePath = #file

        guard let cutIndex = filePath.range(of: Self.projectDirectoryName,
                                            options: .backwards)?.upperBound else {
            return nil
        }
        
        return String(filePath[..<cutIndex]) + "static/"
    }
    
    func loadRessourceFile(name: String) -> Data? {
        guard let staticFilesPath = staticFilesPath else {
            return nil
        }
        
        let ressourcePath = staticFilesPath.appending(name)
        return try? NSData(contentsOfFile: ressourcePath) as Data
    }
    
    func port() throws -> Int {
        return try server.port()
    }
    
    func start() throws {
        try server.start()
    }
}
