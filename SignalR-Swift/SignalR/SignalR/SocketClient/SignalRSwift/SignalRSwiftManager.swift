//
//  SignalRSwiftManager.swift
//  SignalR
//
//  Created by Nouman Gul Junejo on 14/02/2023.
//

import Foundation
import SignalRSwift

class SignalRSwiftManager  {
    var connectionConnected:ConnectionConnected?
    var connectionStarting:ConnectionStarting?
    var chatHub: HubProxy!
    
    private var connection: HubConnection!
    var chatID = ""
    static let shared = SignalRSwiftManager()
    private init() {}
   
    func connect(){
        let headers = ["Authorization":ConnectionConstants.Config.BEARER]
        connection = HubConnection(withUrl: ConnectionConstants.Config.signalRURL,queryString: headers)
        chatHub = self.connection.createHubProxy(hubName: ConnectionConstants.chatHub)
        _ = chatHub.on(eventName: ConnectionConstants.broadcastMessage) { (args) in
            debugPrint(args)
        }
        
        signalREvents()
    }
    
    func signalREvents(){
        connection.started = { [weak self] in
            guard let self = self else { return }
            self.connectionConnected?("connected")
            debugPrint("Connection Started")
        }
        
        connection.reconnecting = { [weak self] in
            guard let self = self else { return }
            self.connectionStarting?()
            debugPrint("Reconnecting")
        }
        
        connection.reconnected = { [weak self] in
            guard let self = self else { return }
            debugPrint("Reconnected")
            self.connectionStarting?()
        }
        
        connection.closed = { [weak self] in
            guard let self = self else { return }
            debugPrint("Disconnected")
            self.connectionStarting?()
        }
        
        connection.connectionSlow = { [weak self] in
            guard let self = self else { return }
            print("Connection slow...")
            self.connectionStarting?()
        }
        
        connection.error = { [weak self] error in
            guard let self = self else { return }
            let anError = error as NSError
            if anError.code == NSURLErrorTimedOut {
                print("Connection Timeout")
                self.connection.start()
            }
        }
        
        connection.start()
    }
    func disconnect(){
        connection.disconnect()
    }
    
    func connecionState() -> ConnectionState{
        return connection.state
    }
}
