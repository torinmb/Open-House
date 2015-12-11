//
//  PostCell.swift
//  Open House
//
//  Created by blankens on 12/2/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring


protocol PostCellDelegate {
    func profileWasPressed(user: User)
    func socialShareWasPresesd()
    func addToCollectionWasPressed()
}

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postName: DesignableLabel!
    @IBOutlet weak var timeStamp: UILabel!
    var delegate : PostCellDelegate?
    
    @IBAction func profilePressed(sender: AnyObject) {
        if self.delegate != nil {
            self.delegate!.profileWasPressed(self.post.user)
        }
    }
    
    @IBAction func favoritePressed(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
    }
    
    @IBAction func socialSharePressed(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
        button.selected = !button.selected

        if self.delegate != nil {
            self.delegate!.socialShareWasPresesd()
        }
    }
    
    @IBAction func addToCollectionPressed(sender: AnyObject) {
        let button = sender as! DesignableButton
        animateButton(button)
        button.selected = !button.selected
        if self.delegate != nil {
            self.delegate!.addToCollectionWasPressed()
        }

    }
    
    func animateButton(button: DesignableButton) {
        button.selected = !button.selected
        button.animation = "pop"
        button.curve = "easeOut"
        button.duration = 1
        button.animate()
    }
    
    
    lazy var post : Post = Post(user: User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354"), title: "", description: "", timeStamp: "4 Hours Ago", image: UIImage(named: "Living Room")!, products: [])
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    func updateView() {
        self.profileImage.imageView!.image = self.post.user.profileImage
        self.userName.text = self.post.user.userName
        self.postImage.clipsToBounds = true
        self.postImage.image = self.post.image
        self.postName.text = self.post.title
        self.timeStamp.text = self.post.timeStamp

    }
}
