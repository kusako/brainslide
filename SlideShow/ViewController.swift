//
//  ViewController.swift
//  SlideShow
//
//  Created by Markus Strickler on 19.01.17.
//  Copyright © 2017 Markus Strickler. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color to black (why, oh why?)
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor.black
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

