//
//  Space.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Space: UICollectionViewController, SpaceHeaderDelegate {
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
        
    }
    
    override func unwindToViewController(sender: UIStoryboardSegue) {
        print("HI")
    }
    //Create Post
    var tempUser : User?
    
    var post = Post(user:
            User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!, posts: "25", followers: "1.5K", following: "354"),
            title: "Modern Design",
            description: "",
            timeStamp: "4 Hours Ago",
            image: UIImage(named: "Living Room")!,
            products: [Product(name: "Eames Chair", description: "Black Leather", price: "$4500", images: ["eames1", "eames2", "eames3"]), Product(name: "Ball Chair", description: "Designed by Eero Aarnio", price: "$10,565", images: ["ballchair1", "ballchair2", "ballchair3"])])
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.post.products.count
    }
    
    //3
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Product", forIndexPath: indexPath) as! ProductCollectionCell
        
//        print(self.products[indexPath.row].name)
        
        cell.tag = indexPath.row
        cell.product = self.post.products[indexPath.row]
        // Configure the cell
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndex = indexPath.row
    }

    
    override func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            //1
            switch kind {
            case UICollectionElementKindSectionHeader:
                let headerView =
                collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                    withReuseIdentifier: "WebHeader",
                    forIndexPath: indexPath)
                    as! Space3DHeaderView
                headerView.post = self.post
                headerView.delegate = self
//                headerView.label.text = searches[indexPath.section].searchTerm
                return headerView
            default:
                //4
                assert(false, "Unexpected element kind")
            }
    }
    func addToCollectionWasPressed() {
        self.performSegueWithIdentifier("AddCollectionSegue", sender: self)
    }
    
    func profileWasPressed(user: User) {
        self.tempUser = user
        self.performSegueWithIdentifier("Profile2Segue", sender: self)
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
        if segue.identifier == "Profile2Segue" {
            
            let vc = segue.destinationViewController as! Profile
            vc.user = self.tempUser!
            vc.follow = true
        } else if segue.identifier == "ProductSegue" {
            let tvCell = sender as! UICollectionViewCell
            
            let vc = segue.destinationViewController as! ProductViewController
            vc.product = self.post.products[tvCell.tag]
        
        }
    }
    
    //Header Delegeate Method
    
    
    
    
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//
//    }
    
}
