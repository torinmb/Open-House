//
//  Home.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Home: UITableViewController {
    
    var homeCells : [Post] = [
        Post(user:
            User(userName: "Christian Smith",
                profileImage: UIImage(named: "profile")!),
            title: "Modern Design",
            description: "",
            timeStamp: "4 Hours Ago",
            image: UIImage(named: "Living Room")!),
        Post(user:
            User(userName: "Jane Doe",
                profileImage: UIImage(named: "profile")!),
            title: "Futuristic Living Room",
            description: "",
            timeStamp: "6 Hours Ago",
            image: UIImage(named: "Futuristic Living Room")!),
        Post(user:
            User(userName: "Dan The Man",
                profileImage: UIImage(named: "profile")!),
            title: "Home Library",
            description: "",
            timeStamp: "1 Day Ago",
            image: UIImage(named: "Home Library")!)
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeCells.count
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        let post = homeCells[indexPath.row]
        cell.post = post
        cell.updateView()
        
        return cell

    }

}
