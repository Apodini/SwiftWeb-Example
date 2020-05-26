//
//  Server.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 15.05.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb
import SwiftWebScript
import Swifter

class Server {
    static let projectDirectoryName = "SwiftWebServer/"
    
    let swifterServer: HttpServer
    let swiftWebServer: SwiftWebServer
    var staticFilesPath: String?
    
    init<ContentView>(contentView: ContentView, path: String) where ContentView: View {
        swifterServer = HttpServer()
        swiftWebServer = SwiftWebServer(contentView: contentView)
        
        staticFilesPath = getRessourceDirectoryPath(filePath: path)
        
        swifterServer["/"] = { request in
            HttpResponse.ok(.text(HTMLTemplate.withContent("")))
        }
        
        swifterServer["/script.js"] = { request in
            HttpResponse.ok(.text(JavaScriptClient.script))
        }
        
        swifterServer["/static/:path"] = { request in
            print("request: \(request.path)")
            
            guard let fileName = request.path.components(separatedBy: "/").last,
                let ressource = self.loadRessourceFile(name: fileName) else {
                    return HttpResponse.notFound
            }
            
            return HttpResponse.ok(.data(ressource))
        }
        
        swifterServer["/websocket"] = websocket(text: { (session, message) in
            self.swiftWebServer.handleClientMessage(
                session: SwifterWebSocketSession(swifterSession: session),
                message: message
            )
        }, connected: { session in
            self.swiftWebServer.handleClientConnect(
                session: SwifterWebSocketSession(swifterSession: session)
            )
        }, disconnected: { session in
            self.swiftWebServer.handleClientDisconnect(
                session: SwifterWebSocketSession(swifterSession: session)
            )
        })
    }
    
    func getRessourceDirectoryPath(filePath: String) -> String? {
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
    
    public func port() throws -> Int {
        return try swifterServer.port()
    }
    
    public func start() throws {
        try swifterServer.start(80)
    }
}

struct SwifterWebSocketSession: SwiftWeb.WebSocketSession {
    let swifterSession: Swifter.WebSocketSession
    
    func write(text: String) {
        swifterSession.writeText(text)
    }
}
