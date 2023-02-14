//
//  ConnectionManager.swift
//  SignalR
//
//  Created by Nouman Gul Junejo on 05/02/2023.
//

import Foundation
import SwiftR

class ConnectionManager: NSObject {
    
    var connectedChannel:ConnectedChannel?
    var connectedChannelDecodingFailed:ConnectedChannelDecodingFailed?
    var connectionErrorDictionary:ConnectionErrorDictionary?
    var connectionError:ConnectionError?
    var connectionConnected:ConnectionConnected?
    var connectionStarting:ConnectionStarting?
    var connectionSlow:ConnectionSlow?
    var connectionReconnecting:ConnectionReconnecting?
    var connectionReconnected:ConnectionReconnected?
    var connectionDisconnected:ConnectionDisconnected?
    var connectionFailed:ConnectionFailed?
    
    static let shared = ConnectionManager()
    
    private let connection = SignalR(ConnectionConstants.Config.signalRURL)
    var connectionID:String?{
        return connection.connectionID
    }
    
    func connect(){
        connection.useWKWebView = true
        connection.signalRVersion = .v2_0_0
        connection.queryString = ["Authorization":ConnectionConstants.Config.BEARER]
        
        let simpleHub = Hub(ConnectionConstants.chatHub)
        simpleHub.on(ConnectionConstants.broadcastMessage) { args in
            if let jsonString = args?.first as? String, let dict = jsonString.convertToDictionary(), let channel = dict["CHANNEL"] as? String{

                let channelType = ConnectionConstants.ConnectedOptions(rawValue: channel)
                self.connectedChannel?(channelType)
            }else{
                self.connectedChannelDecodingFailed?("failed to decode object")
            }
        }
        connection.addHub(simpleHub)
        
        self.handleCallbacks()
        
        self.startConnection()
    }
    
    private func handleCallbacks(){
        connection.starting = {
            self.connectionStarting?()
        }
        connection.connected = {
            self.connectionConnected?(self.connection.connectionID)
        }
        connection.connectionSlow = {
            self.connectionSlow?()
        }
        connection.reconnecting = {
            self.connectionReconnecting?()
        }
        connection.reconnected = {
            self.connectionReconnected?()
        }
        connection.disconnected = {
            self.connectionDisconnected?()
        }
        connection.connectionFailed = {
            self.connectionFailed?()
        }
        connection.error = { dict in
            self.connectionErrorDictionary?(dict)
        }
    }
    
    private func startConnection(){
        connection.start()
    }
    
    private func stopConnection(){
        connection.stop()
    }
    
    private func handleUnstableConnection(){
        self.connect()
    }
}

extension String{
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

