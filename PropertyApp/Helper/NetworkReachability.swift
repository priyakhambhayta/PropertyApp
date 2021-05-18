//
//  NetworkReachability.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 12/05/21.
//

import Foundation
import Network

class NetworkReachability {
    static let shared = NetworkReachability()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool  {status == .satisfied}
    var isReachableOnCellular: Bool = true

    func startMonitoring(isAvailable: @escaping (Bool) -> Void) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                print("We're connected!")
                // post connected notification
                isAvailable(true)
            } else {
                print("No connection.")
                // post disconnected notification
                isAvailable(false)
                
            }
           // print(path.isExpensive)
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
