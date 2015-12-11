//
//  Explore.swift
//  Open House
//
//  Created by blankens on 11/21/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit
import Spring

class Explore: UITableViewController {
    // MARK: - Table View

    
    let exploreCells = ["Staff Picks", "Featured", "Living Room", "Kitchen", "Bedroom", "Bath Room"]
    
    let data : [String : [Post]] = ["Staff Picks" :
        [Post(user:
            User(userName: "Christian Smith", profileImage: UIImage(named: "profile2")!,
                posts: "25",
                followers: "1.5K",
                following: "354"),
            title: "Simple Elegance",
            description: "A spacious and elegant setting for gatherings",
            timeStamp: "20 Minutes Ago",
            image: UIImage(named: "Ashley-luxe-sectional")!,
            products: [
                Product(name: "Noguchi Coffee Table", description: "Designed and made in Japan", price: "$959.00", images: ["Noguchi coffee table gray 3", "Noguchi coffee table gray 1", "Noguchi coffee table gray 2"]),
                Product(name: "Eames Chair", description: "Black Leather", price: "$512.00", images: ["eames1", "eames2", "eames3"]),
                Product(name: "Quby Shelf", description: "Simple yet complex shelf", price: "$332.00", images: ["Quby Shelf black 1", "Quby Shelf black 2", "Quby Shelf black 3"]),
                Product(name: "Grund Corner Shelf", description: "Fits right for corners", price: "$129.00", images: ["grund1", "grund2", "grund3"]),
                Product(name: "Nutid Microwave Oven", description: "Stainless Steel", price: "$362.00", images: ["nutid1", "nutid2", "nutid3"])])]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCellWithIdentifier("SearchCell")
//        return tableView.dequeueReusableHeaderFooterViewWithIdentifier("SearchCell")
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreCells.count
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = self.tableView.contentOffset.y
        for cell in self.tableView.visibleCells as! [ExploreCell] {
            let x = cell.bgImage.frame.origin.x
            let w = cell.bgImage.bounds.width
            let h = cell.bgImage.bounds.height
            let y = ((offsetY - cell.frame.origin.y) / h) * 25
            cell.bgImage.frame = CGRectMake(x, y, w, h)
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Explore", forIndexPath: indexPath) as! ExploreCell
        let text = exploreCells[indexPath.row]
        cell.label.text = text
        if let image = UIImage(named: text){
            cell.bgImage.image = image
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FeedSegue" {
            let tvCell = sender as! ExploreCell
            
            let vc = segue.destinationViewController as! Home
            let text = tvCell.label.text!
            vc.posts = self.data[text]!
            vc.navigationItem.title = text
            
        }
    }
    
    
    
}
