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

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
}

