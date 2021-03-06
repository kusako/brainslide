//
//  AppDelegate.swift
//  SlideShow
//
//  Created by Markus Strickler on 19.01.17.
//  Copyright © 2017 Markus Strickler. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var imageFolder: URL?
    
    @IBAction func openDocument(_ sender:AnyObject) {
        NSLog("File open...")
        let dialog = NSOpenPanel()
        
        dialog.title                   = "Choose an image folder"
        dialog.showsResizeIndicator    = true
        dialog.showsHiddenFiles        = false
        dialog.canChooseDirectories    = true
        dialog.canCreateDirectories    = false
        dialog.allowsMultipleSelection = false
        dialog.canChooseFiles          = false
        
        if (dialog.runModal() == NSModalResponseOK) {
            if let result = dialog.url {
                NSLog("Selected path '\(result)'")
                self.imageFolder = result
            } else {
                NSLog("No path selected")
            }
        } else {
            NSLog("User clicked on Cancel")
        }
        
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

