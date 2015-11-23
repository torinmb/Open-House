//
//  ExploreCell.swift
//  Open House
//
//  Created by blankens on 11/21/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring

class ExploreCell: UITableViewCell {

    @IBOutlet weak var imgWrapper: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var label: SpringLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgWrapper.clipsToBounds = true
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
