//
//  Home.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Home: UITableViewController, PostCellDelegate {
    
    lazy var tempUser = User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354")
    
    var posts : [Post] = [
        Post(user:
            User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354"),
            title: "Modern Design",
            description: "",
            timeStamp: "4 Hours Ago",
            image: UIImage(named: "Living Room")!,
            products: []),
        Post(user:
            User(userName: "Jane Doe", profileImage: UIImage(named: "profile2")!, posts: "2", followers: "80", following: "354"),
            title: "Futuristic Living Room",
            description: "",
            timeStamp: "6 Hours Ago",
            image: UIImage(named: "Futuristic Living Room")!,
            products: []),
        Post(user:
            User(userName: "Dan The Man", profileImage: UIImage(named: "profile2")!, posts: "80", followers: "1.8K", following: "800"),
            title: "Home Library",
            description: "",
            timeStamp: "1 Day Ago",
            image: UIImage(named: "Home Library")!,
            products: [])
        ] {
        didSet {
//            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        let post = posts[indexPath.row]
        cell.post = post
        cell.updateView()
        cell.delegate = self
        
        return cell

    }
    
    func addToCollectionWasPressed() {
        self.performSegueWithIdentifier("AddToCollectionSegue", sender: self)
    }
    
    func profileWasPressed(user: User) {
        self.tempUser = user
        self.performSegueWithIdentifier("ProfileSegue", sender: self)
    }
    
    func socialShareWasPresesd() {
        var sharingItems = [AnyObject]()
        sharingItems.append("New Social Share")
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        
        
        if(activityViewController.popoverPresentationController != nil) {
            activityViewController.popoverPresentationController?.sourceView = self.view;
            let frame = UIScreen.mainScreen().bounds
            //            frame.height = frame.height / 2
            let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height / 2)
            activityViewController.popoverPresentationController?.sourceRect = frame;
        }
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProfileSegue" {
            
            let vc = segue.destinationViewController as! Profile
            vc.user = self.tempUser
            vc.follow = true
        }
        
        if segue.identifier == "SpaceSegue" {
            print("Space Segue")
            let tvCell = sender as! PostCell
            
            let vc = segue.destinationViewController as! Space
            if tvCell.post.products.count > 0 {
                vc.post = tvCell.post
//                vc.products = tvCell.post.products
            }
            
        }
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    
    }
//    override func unwindToViewController(sender: UIStoryboardSegue) {
//        print("HI")
//    }
//    
    

}
