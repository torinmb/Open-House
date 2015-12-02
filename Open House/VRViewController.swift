//
//  VRViewController.swift
//  Open House
//
//  Created by blankens on 11/25/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class VRViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        let url = NSURL (string: "https://vr.chromeexperiments.com/");
        let requestObj = NSURLRequest(URL: url!);
        self.webView.loadRequest(requestObj);

    }
}
