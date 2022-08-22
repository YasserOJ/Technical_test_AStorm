//
//  Connectivity.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Network

@available(iOS 12.0, *)
class NetworkMonitor {
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection

    func startMonitoring(complition: @escaping ((Bool) -> ())) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            if path.status == .satisfied {
                complition(true)
            } else {
                complition(false)
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
