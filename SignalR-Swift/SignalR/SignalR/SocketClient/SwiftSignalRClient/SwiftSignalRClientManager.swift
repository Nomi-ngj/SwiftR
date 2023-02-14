//
//  SwiftSignalRClientManager.swift
//  SignalR
//
//  Created by Nouman Gul Junejo on 14/02/2023.
//

import Foundation
import SwiftSignalRClient

class SwiftSignalRClientManager : HubConnectionDelegate{
    static let shared = SwiftSignalRClientManager()
    private var connection: HubConnection?
    private init() {}
    
    func connect(){
        
        let cBuilder = HubConnectionBuilder(url: URL(string: ConnectionConstants.Config.signalRURL)!)
        _ = cBuilder.withPermittedTransportTypes(.all)
        connection = cBuilder.withLogging(minLogLevel: .debug).build()
        connection?.on(method: ConnectionConstants.broadcastMessage, callback: { (user: String, message: String) in
            do {
                self.handleMessage(message, from: user)
            } catch {
                print(error)
            }
        })
        
        connection?.start()
        connection?.delegate = self
    }
    
    private func handleMessage(_ message: String, from user: String) {
        // Do something with the message.
    }
    
    public func connectionDidOpen(hubConnection: HubConnection) {
        debugPrint("Open")
    }
    
    public func connectionDidFailToOpen(error: Error) {
        debugPrint("Failed")
    }
    
    public func connectionDidClose(error: Error?) {
        debugPrint("Closed")
    }
}
