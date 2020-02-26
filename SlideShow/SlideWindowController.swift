//
//  SlideWindowController.swift
//  SlideShow
//
//  Created by Markus Strickler on 03.02.17.
//  Copyright © 2017 Markus Strickler. All rights reserved.
//

import Cocoa

class SlideWindowController: NSWindowController {

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

    @IBAction func toggleFullScreen(_ sender: Any?) {
        NSLog("Toggle full screen")

        guard let window = window else { return }
        NSCursor.hide()

        window.toggleFullScreen(self)
        
        // NSCursor.setHiddenUntilMouseMoves(window.styleMask.contains(NSFullScreenWindowMask))

    }
    
    override func windowDidLoad() {
        NSLog("Window did load")
        super.windowDidLoad()
    }

}

