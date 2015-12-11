//
//  Space3DHeaderView.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring


protocol SpaceHeaderDelegate {
    func profileWasPressed(user: User)
    func socialShareWasPresesd()
    func addToCollectionWasPressed()
}

class Space3DHeaderView: UICollectionReusableView {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spaceName: UILabel!
    @IBOutlet weak var spaceDescription: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    var delegate : SpaceHeaderDelegate?
    
    
    lazy var post : Post = Post(user: User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354"), title: "", description: "", timeStamp: "4 Hours Ago", image: UIImage(named: "Living Room")!, products: [])
    
    @IBAction func favoriteSelected(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
    }
    
    @IBAction func addToCollectionSelected(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
        button.selected = !button.selected
        if self.delegate != nil {
            self.delegate!.addToCollectionWasPressed()
        }
    }
    
    @IBAction func shareSelected(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
        button.selected = !button.selected
        
        if self.delegate != nil {
            self.delegate!.socialShareWasPresesd()
        }
    }
    @IBAction func profileSelected(sender: AnyObject) {
        if self.delegate != nil {
            self.delegate!.profileWasPressed(self.post.user)
        }
    }
    
    func animateButton(button: DesignableButton) {
        button.selected = !button.selected
        button.animation = "pop"
        button.curve = "easeOut"
        button.duration = 1
        button.animate()
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
        print("Loading 3D Room")
        let url = NSURL (string: "https://www.shapespark.com/formikodesign/old-brewery-apartment");
        let requestObj = NSURLRequest(URL: url!);
        self.webView.loadRequest(requestObj);
        print("Loaded 3D Room")
    }
    
    func updateView() {
        self.userName.text = self.post.user.userName
        self.timeStamp.text = self.post.timeStamp
        self.spaceName.text = self.post.title
        self.timeStamp.text = self.post.timeStamp
        self.spaceName.text = self.post.title
    }
    
}
