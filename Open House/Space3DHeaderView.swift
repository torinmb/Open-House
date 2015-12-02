//
//  Space3DHeaderView.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Space3DHeaderView: UICollectionReusableView {

    @IBOutlet weak var webView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Loading 3D Room")
        let url = NSURL (string: "https://www.shapespark.com/formikodesign/old-brewery-apartment");
        let requestObj = NSURLRequest(URL: url!);
        self.webView.loadRequest(requestObj);
        print("Loaded 3D Room")
    }
}
