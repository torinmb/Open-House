//
//  PostCell.swift
//  Open House
//
//  Created by blankens on 12/2/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring

class PostCell: UITableViewCell {
    

    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postName: DesignableLabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    lazy var post : Post = Post(user: User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!), title: "", description: "", timeStamp: "4 Hours Ago", image: UIImage(named: "Living Room")!)
    
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
