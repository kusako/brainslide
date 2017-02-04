//
//  ViewController.swift
//  SlideShow
//
//  Created by Markus Strickler on 19.01.17.
//  Copyright © 2017 Markus Strickler. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var currentIndex = 0
    var imageFolder: URL!
    var imagePaths: [URL]!

    @IBOutlet weak var imageView: NSImageView?
    var appDelegate: AppDelegate!
    
    func nextImage() {
        NSLog("next")
        currentIndex += 1
        showImageAtURL((self.imagePaths?[currentIndex])!)
    }

    func previousImage() {
        NSLog("previous")
        currentIndex -= 1
        showImageAtURL((self.imagePaths?[currentIndex])!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color to black (why, oh why?)
        self.view.wantsLayer = true
        
        self.appDelegate = NSApplication.shared().delegate as? AppDelegate
        self.appDelegate?.viewController = self
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear() {
        self.view.layer?.backgroundColor = CGColor.black
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    func showFirstImage() {
        currentIndex = 0
        showImageAtURL((self.imagePaths?[0])!)
    }
    
    func showImageAtURL(_ url: URL) {
        NSLog("Showing new image")
        let image = NSImage(byReferencing: url)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        imageView?.layer?.add(transition, forKey: kCATransition)
        
        imageView?.image = image
        
        CATransaction.commit()
    }
}

