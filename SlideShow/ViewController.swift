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
    var imagePaths: [URL] = []

    let allowedFileTypes: Set = ["jpg", "jpeg", "png", "gif", "tif", "tiff"]

    @IBOutlet weak var imageView: NSImageView?
    
    func nextImage() {
        NSLog("next")
        if self.imagePaths.count > currentIndex {
            currentIndex += 1
            showCurrentImage()
        }
    }

    func previousImage() {
        NSLog("previous")
        if currentIndex > 0 {
            currentIndex -= 1
            showCurrentImage()
        }
    }

    func showCurrentImage() {
        showImageAtURL(self.imagePaths[currentIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color to black (why, oh why?)
        self.view.wantsLayer = true
        
        let appDelegate = NSApplication.shared().delegate as? AppDelegate
        appDelegate?.viewController = self
        
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

    func loadSlides(fromURL: URL) {
        self.imagePaths = self.getImagesFromPath(fromURL)
        currentIndex = 0

        if !self.imagePaths.isEmpty {
            self.showCurrentImage()
            self.view.window?.makeKeyAndOrderFront(self)
            self.view.window?.toggleFullScreen(self)
        }
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

    func getImagesFromPath(_ path:URL) -> [URL] {
        let fm = FileManager.default
        let files = try! fm.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
        
        return files.filter( {
            allowedFileTypes.contains($0.pathExtension.lowercased())
        })
    }

}

