//
//  ProductCollectionCell.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring

struct Product {
    var name : String
    var description: String
    var price : String
    var images : [String]
}

class ProductCollectionCell: UICollectionViewCell {

    @IBOutlet weak var view: DesignableView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var imageIndex = 0
    var product : Product = Product(name: "", description: "", price: "", images: ["eames1"]) {
        didSet {
            self.image.image = UIImage(named: self.product.images[0])
            self.name.text = self.product.name
            self.price.text = self.product.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.image.clipsToBounds = true
        self.view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: "swiped:"))
        self.image.image = UIImage(named: self.product.images[0])
        self.name.text = self.product.name
        self.price.text = self.product.price
    }
    
    func swiped(gesture: UISwipeGestureRecognizer) {
        print("Swipe Called")
        
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        
        switch gesture.direction {
            
        case UISwipeGestureRecognizerDirection.Right :
            print("Swipe Right")
            imageIndex--
            if imageIndex < 0 {
                imageIndex = self.product.images.count - 1
            }
            image.image = UIImage(named: self.product.images[imageIndex])
            
        case UISwipeGestureRecognizerDirection.Left :
            print("Swipe Left")
            imageIndex++
            if imageIndex > self.product.images.count {
                imageIndex = 0
            }
            image.image = UIImage(named: self.product.images[imageIndex])
        default:
            break //stops the code/codes nothing.
        }
    }
    
}
