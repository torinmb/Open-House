//
//  CollectionCell.swift
//  Open House
//
//  Created by blankens on 12/2/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring

class CollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var collectionView: DesignableView!
//    @IBOutlet weak var imgWrapper: UIView!
    @IBOutlet weak var label: DesignableLabel!
    
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.imgWrapper.clipsToBounds = true
        
        // Initialization code
    }
}
