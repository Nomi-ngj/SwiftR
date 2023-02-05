//
//  ConnectionConstants.swift
//  SignalR
//
//  Created by Nouman Gul Junejo on 05/02/2023.
//

import Foundation

struct ConnectionConstants{
    static let chatHub = "ChatHub"
    static let broadcastMessage = "broadcastMessage"
    static let connectionStarting = "Connection Starting"
    static let connectionSlow = "Connection Slow"
    static let connectionReconnecting = "Connection Reconnecting"
    static let connectionReconnected = "Connection Reconnected"
    static let connectionDisconnected = "Connection Disconnected"
    static let connectionFailed = "Connection Failed"
    
    enum ConnectedOptions:String{
        case channelDisconnect = "channel_disconnect"
        case channelAnswered = "channel_answered"
        case intercomIncoming = "intercom_incoming"
        case intercomDisconnect = "intercom_disconnect"
    }
    
    struct Config{
        static let signalRURL = <# SignalRUrl #>
        static let ENVIRONMENT = <#ENVIRONMENT#>
        static let BEARER = <#BEARER#>
    }
}
