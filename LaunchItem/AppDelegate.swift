//
//  AppDelegate.swift
//  LaunchItem
//
//  Created by xaoxuu on 2019/4/5.
//  Copyright © 2019 Titan Studio. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let mainAppId = "com.xaoxuu.Translate"
        var alreadyRunning = false
        
        for app in NSWorkspace.shared.runningApplications {
            if app.bundleIdentifier == mainAppId {
                alreadyRunning = true
                break
            }
        }
        
        if !alreadyRunning {
            DistributedNotificationCenter.default().addObserver(self, selector: #selector(terminate), name: NSNotification.Name.init("killme"), object: mainAppId)
            let path = Bundle.main.bundlePath as NSString
            var components = path.pathComponents
            components.removeLast()
            components.removeLast()
            components.removeLast()
            components.append("MacOS")
            components.append("MainApplication")
            let newPath = NSString.path(withComponents: components)
            NSWorkspace.shared.launchApplication(newPath)
        } else {
            terminate()
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func terminate() {
        NSApp.terminate(self)
    }


}

