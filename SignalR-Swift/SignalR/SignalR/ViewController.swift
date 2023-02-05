//
//  ViewController.swift
//  SignalR
//
//  Created by Nouman Gul Junejo on 05/02/2023.
//

import UIKit

class ViewController: UIViewController {

    let labelTag = 9001
    weak var connectionManager = ConnectionManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        statusLabel.tag = labelTag
        self.view.addSubview(statusLabel)
        statusLabel.center = self.view.center
        
        //Make sure to install pods and set value in OpenTokConfig file
        // signalRURL = ""
        // ENVIRONMENT = ""
        // BEARER = ""
        connectionManager?.connect()
        handleCallbacks()
        
    }
    
    func handleCallbacks(){
        let label = view.viewWithTag(labelTag) as? UILabel
        
        connectionManager?.connectedChannel = { connectionType in
            label?.text = "connectedChannel: \(connectionType?.rawValue ?? "")"
            switch connectionType {
            case .channelDisconnect:
                debugPrint("do something")
            case .channelAnswered:
                debugPrint("do something")
            case .intercomIncoming:
                debugPrint("do something")
            case .intercomDisconnect:
                debugPrint("do something")
            default:
                debugPrint("do something")
            }
        }
        
        connectionManager?.connectedChannelDecodingFailed = { decodingFailure in
            debugPrint(decodingFailure)
        }
        
        connectionManager?.connectionConnected = { channelID in
            debugPrint(channelID ?? "")
            label?.text = "connectedId channelID: \(channelID ?? "")"
        }
        
        connectionManager?.connectionError = { error in
            if let error = error{
                label?.text = error.localizedDescription
                debugPrint(error)
            }
        }
        
        connectionManager?.connectionStarting = {
            label?.text = ConnectionConstants.connectionStarting
            debugPrint(ConnectionConstants.connectionStarting)
        }
        
        connectionManager?.connectionSlow = {
            label?.text = ConnectionConstants.connectionSlow
            debugPrint(ConnectionConstants.connectionSlow)
        }
        
        connectionManager?.connectionReconnecting = {
            label?.text = ConnectionConstants.connectionReconnecting
            debugPrint(ConnectionConstants.connectionReconnecting)
        }
        
        connectionManager?.connectionReconnected = {
            label?.text = ConnectionConstants.connectionReconnected
            debugPrint(ConnectionConstants.connectionReconnected)
        }
        
        connectionManager?.connectionDisconnected = {
            label?.text = ConnectionConstants.connectionDisconnected
            debugPrint(ConnectionConstants.connectionDisconnected)
        }
        
        connectionManager?.connectionFailed = {
            label?.text = ConnectionConstants.connectionFailed
            debugPrint(ConnectionConstants.connectionFailed)
        }
    }
}
