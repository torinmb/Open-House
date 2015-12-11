//
//  UserProfileCell.swift
//  Open House
//
//  Created by blankens on 12/2/15.
//  Copyright © 2015 UW. All rights reserved.
//

import Foundation
import UIKit
import Spring

class UserProfileCell: UITableViewCell {

    @IBOutlet weak var posts: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var followButton: DesignableButton!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
//    lazy var user : User = User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!)
    var follow = false
    lazy var user: User = User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354")

    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    @IBAction func followPressed(sender: AnyObject) {
        self.followButton.animation = "pop"
        self.followButton.duration = 1.0
        self.followButton.selected = !self.followButton.selected
        self.followButton.animate()
        
    }

    func updateView() {
        if self.follow {
            self.followButton.setTitle("FOLLOW", forState: .Normal)
            self.followButton.setTitle("FOLLOWING", forState: .Selected)
        } else {
            self.followButton.setTitle("EDIT PROFILE", forState: .Normal)
            self.followButton.setTitle("EDIT PROFILE", forState: .Selected)
        }
        self.userName.text = self.user.userName
        self.profileImage.image = self.user.profileImage
        self.posts.text = self.user.posts
        self.followers.text = self.user.followers
        self.following.text = self.user.following
    }
}

