//
//  ProductViewController.swift
//  Open House
//
//  Created by blankens on 11/29/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring

class ProductViewController: UIViewController {
    
    @IBOutlet weak var imgViewController: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var purchase: DesignableButton!
    var viewLoaded = false
    
    var product : Product =  Product(name: "", description: "", price: "", images: ["eames1"])
//        didSet {
//            if self.viewLoaded {
//                self.name.text = self.product.name
//                self.productDescription.text = self.product.description
//                self.purchase.titleLabel!.text = self.product.price
//            }
//        }
//    }
    
    @IBAction func socialSharePressed(sender: AnyObject) {
        var sharingItems = [AnyObject]()
        sharingItems.append("New Social Share")
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        
        
        if(activityViewController.popoverPresentationController != nil) {
            activityViewController.popoverPresentationController?.sourceView = self.view;
            let frame = UIScreen.mainScreen().bounds
            //            frame.height = frame.height / 2
            var newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height / 2)
            activityViewController.popoverPresentationController?.sourceRect = frame;
        }
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func favoritePressed(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
    }
    
    
    @IBAction func addToCollectionPressed(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
        button.selected = !button.selected
        self.performSegueWithIdentifier("AddCollectionSegue", sender: self)
    }
    
    func animateButton(button: DesignableButton) {
        button.selected = !button.selected
        button.animation = "pop"
        button.curve = "easeOut"
        button.duration = 1
        button.animate()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ImageScollViewSegue" {
            let vc = segue.destinationViewController as! PagedScrollViewController
            vc.pageImages = self.product.images.map {UIImage(named: $0)!}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "AR"), style: .Plain, target: self, action: "arSelected:")
        self.viewLoaded = true
        self.name.text = self.product.name
        self.productDescription.text = self.product.description
        self.purchase.setTitle(self.product.price, forState: .Normal)
        
        
    }
    
//    func arSelected(sender: AnyObject) {
//        self.performSegueWithIdentifier("ARSegue", sender: self)
//    }

}
