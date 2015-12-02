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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ImageScollViewSegue" {
            let vc = segue.destinationViewController as! PagedScrollViewController
            vc.pageImages = self.product.images.map {UIImage(named: $0)!}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewLoaded = true
        self.name.text = self.product.name
        self.productDescription.text = self.product.description
        self.purchase.titleLabel!.text = self.product.price
        
    }

}
