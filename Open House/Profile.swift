//
//  Profile.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Profile: UITableViewController {
    var user: User = User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354")
    
    var follow = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell") as! UserProfileCell
        cell.user = self.user
        cell.follow = self.follow
        cell.updateView()
        return cell
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 135
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell") as! UserProfileCell
//            cell.user = self.user
//            cell.updateView()
//            return cell
//        } else {
        let cell = tableView.dequeueReusableCellWithIdentifier("Likes")
        return cell!
        
//        }
    }
    
}
