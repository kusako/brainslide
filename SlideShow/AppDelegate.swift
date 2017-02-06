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
    
    var viewController: ViewController!
    let allowedFileTypes: Set = ["jpg", "jpeg", "png", "gif", "tiff"]
    
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
                self.viewController.imageFolder = result
                self.viewController.imagePaths = self.getImagesFromPath(result)
                self.viewController.showFirstImage()                
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
    
    func getImagesFromPath(_ path:URL) -> [URL] {
        let fm = FileManager.default
        let files = try! fm.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)

        return files.filter { filename in
            allowedFileTypes.contains(filename.pathExtension.lowercased())
        }
    }
}

