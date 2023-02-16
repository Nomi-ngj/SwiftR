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
                static let baseURL = "https://rad-staging.azurewebsites.net"
//        static let baseUrl = "https://rad-dashboard.azurewebsites.net"
//                static let signalRURL = "https://rad-dashboard.azurewebsites.net"
                static let signalRURL = "\(baseURL)/signalr"
        //        static let signalRURL = <# SignalRUrl #>
        //        static let ENVIRONMENT = <#ENVIRONMENT#>
        //        static let BEARER = <#BEARER#>
                static let BEARER = "Bearer ImWML4OZc37lBtpIyp3FWUg3RlFkc8Wmjx8QGL7Z5oqrPvR6ZowR7ZZsM2VmfeXYm0tp1b7BpnusLMhT-0H5ArLCogpoolD3vg0PoSGPPBvzNYAPUNc1ZdDYSh1kZ6OlPh_65bIXEjVbQ6yU4BNspSEXzMMX7f-02Y7a0kfqg9JKnq_KJXDSNI_ZD28GIR4NdGGRXOOm9ARsdjjcb9ov6q6dppSyiH807sEdfcUasFua0RlQHqjb5CUAit7w6zwwhSvywHh0EuvUH3EkMiUPwa2D7jhXtaN_gtoa8I1YcXQqVngYCU4_Ns6szO3eF9nVx1lQR6r_vhGdU7leCAwZ7pENhUduGKw9creBlSsJZxMfPfD9hnpMC-3mcMWprBmYW-_3iIedmKmAuYayQIiaxbR4QhaHiqvmTgX7BLFVspz9aJ0ukUYuVcYeUFzdL55Tc6aYUoPya4SyGgOjaaI6sTa8eH_prR6RWPiBp-HZVAg"
    }
}
