//
//  EventMonitor.swift
//  Translate
//
//  Created by xaoxuu on 2019/4/5.
//  Copyright © 2019 Titan Studio. All rights reserved.
//

import Cocoa

class EventMonitor: NSObject {

    var monitor: Any? = nil
    var mask: NSEvent.EventTypeMask
    var handler: (NSEvent) -> Void
    
    init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent) -> Void) {
        self.mask = mask
        self.handler = handler
    }
    
    func start(){
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    func stop(){
        if let m = monitor {
            NSEvent.removeMonitor(m)
            monitor = nil
        }
    }
    
    
}
