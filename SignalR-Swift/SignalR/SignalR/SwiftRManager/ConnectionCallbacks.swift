//
//  ConnectionCallbacks.swift
//  SignalR
//
//  Created by Nouman Gul Junejo on 05/02/2023.
//

import Foundation

typealias ConnectedChannel = (ConnectionConstants.ConnectedOptions?) -> ()
typealias ConnectedChannelDecodingFailed = (String) -> ()
typealias ConnectionStarting = () -> ()
typealias ConnectionConnected = (_ connectionID:String?) -> ()
typealias ConnectionSlow = () -> ()
typealias ConnectionReconnecting = () -> ()
typealias ConnectionReconnected = () -> ()
typealias ConnectionDisconnected = () -> ()
typealias ConnectionFailed = () -> ()
typealias ConnectionErrorDictionary = (([String: Any]?) -> ())
typealias ConnectionError = ((Error?) -> ())

