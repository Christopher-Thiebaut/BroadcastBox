//
//  Broadcaster.swift
//  
//
//  Created by Christopher Thiebaut on 8/6/19.
//

import Foundation

public class Broadcaster<T> {
    public typealias Receiver = (T) -> Void
    var audience = [Receiver]()
    var data: T? {
        didSet {
            guard let output = data else { return }
            for receiver in audience {
                receiver(output)
            }
        }
    }
    
    public func listen(_ listener: @escaping Receiver) {
        audience.append(listener)
        if let output = data {
            listener(output)
        }
    }
}

public final class SingleSourceBroadcaster<T>: Broadcaster<T> {
    
    public init(source: PassthroughBroadcaster<T>) {
        super.init()
        source.listen { [weak self] data in
            self?.data = data
        }
    }
}

public final class PassthroughBroadcaster<T>: Broadcaster<T> {
    public override init() {}
    public func send(_ output: T) {
        data = output
    }
}
