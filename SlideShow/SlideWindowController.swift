//
//  SlideWindowController.swift
//  SlideShow
//
//  Created by Markus Strickler on 03.02.17.
//  Copyright © 2017 Markus Strickler. All rights reserved.
//

import Cocoa

class SlideWindowController: NSWindowController, NSWindowDelegate {

    @IBAction override func moveRight(_ sender: Any?) {
        NSLog("right")
        if let view = self.window?.contentViewController as! ViewController? {
            view.nextImage()
        }
    }

    @IBAction override func moveLeft(_ sender: Any?) {
        NSLog("left")
        if let view = self.window?.contentViewController as! ViewController? {
            view.previousImage()
        }
    }
    
    override func windowDidLoad() {
        NSLog("Window did load")
        // window?.delegate = self
        super.windowDidLoad()
    }

    func windowDidEnterFullScreen(_ notification: Notification) {
        NSLog("Entered full Screen")
        NSCursor.hide()
    }
    
    func windowDidExitFullScreen(_ notification: Notification) {
        NSLog("Exit full Screen")
        NSCursor.unhide()
    }
}

