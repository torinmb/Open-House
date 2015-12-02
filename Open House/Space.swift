//
//  Space.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Space: UICollectionViewController {
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
    }
    
    override func unwindToViewController(sender: UIStoryboardSegue) {
        print("HI")
    }
    
    var products = [Product(name: "Eames Chair", description: "Black Leather", price: "$4500", images: ["eames1", "eames2", "eames3"]), Product(name: "Ball Chair", description: "Designed by Eero Aarnio", price: "$10,565", images: ["ballchair1", "ballchair2", "ballchair3"])]
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    //3
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Product", forIndexPath: indexPath) as! ProductCollectionCell
        print(self.products[indexPath.row].name)
        cell.tag = indexPath.row
        cell.product = self.products[indexPath.row]
        
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
//                headerView.label.text = searches[indexPath.section].searchTerm
                return headerView
            default:
                //4
                assert(false, "Unexpected element kind")
            }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductSegue" {
            let tvCell = sender as! UICollectionViewCell
            
            let vc = segue.destinationViewController as! ProductViewController
            vc.product = self.products[tvCell.tag]
        
        }
    }
    
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
    
}
