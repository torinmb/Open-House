//
//  Space.swift
//  Open House
//
//  Created by blankens on 11/22/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class Space: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
    }
    
    var products = [Product(name: "Eames Chair", description: "Black Leather", price: "$4500", images: ["eames1", "eames2", "eames3"])]
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return products.count
    }
    
    //2
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    //3
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Product", forIndexPath: indexPath) as! ProductCollectionCell
        cell.product = self.products[indexPath.row]
        // Configure the cell
        return cell
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
    
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
    
}
