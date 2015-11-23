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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
//        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! ExploreCell?
//        var cell : ExploreCell
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier) as! ExploreCell
//        }
        let cell = tableView.dequeueReusableCellWithIdentifier("Explore", forIndexPath: indexPath) as! ExploreCell
//        let cell = UITableViewCell() as! ExploreCell
//        cell.reuseIdentifier = cellIdentifier
//        let cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier) as! ExploreCell
        let text = exploreCells[indexPath.row]
        cell.label.text = text
        if let image = UIImage(named: text){
            cell.bgImage.image = image
        }

        return cell
    }
    
}
