//
//  CollectionsViewController.swift
//  Open House
//
//  Created by blankens on 12/2/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class CollectionsViewController: UICollectionViewController {
    var collections = [(UIImage(named: "eames1")!, "Modern Design"), (UIImage(named: "Craftman Kitchen")!, "Kitchen"), (UIImage(named: "Bath Room")!, "Bath Room"), (UIImage(named: "glitt1")!, "Sinks"), (UIImage(named: "freeze2")!, "Freezers"), (UIImage(named: "hem2")!, "Coffee Tables"), (UIImage(named: "nutid2")!, "Microwaves")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        if self.navigationController != nil {
            self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Graphik-Black", size: 20)!]
        }
        
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    //3
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollectionCell
        
        cell.img.image = self.collections[indexPath.row].0
        cell.label.text = self.collections[indexPath.row].1
        // Configure the cell
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        print("SELECTED")
        let cell = self.collectionView(self.collectionView!, cellForItemAtIndexPath: indexPath) as! CollectionCell
//        cell.collectionView.borderColor = UIColor.greenColor()
        cell.collectionView!.borderColor = UIColor.greenColor()
        cell.label!.textColor! = UIColor.greenColor()
        collectionView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
//        cell.selected = !cell.selected
//        if cell.selected {
//            cell.collectionView.borderColor = UIColor.greenColor()
//        } else {
//            cell.collectionView.borderColor = UIColor.lightGrayColor()
//        }
        print("SELECTED\(cell.label!.text)")
//        self.collectionView!.reloadItemsAtIndexPaths([indexPath])
//        self.collectionView!.reloadData()
    }
//    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        let offsetY = self.collectionView!.contentOffset.y
//        for cell in self.collectionView!.visibleCells() as! [CollectionCell] {
//            let x = cell.img.frame.origin.x
//            let w = cell.img.bounds.width
//            let h = cell.img.bounds.height
//            let y = ((offsetY - cell.frame.origin.y) / h) * 25
//            cell.img.frame = CGRectMake(x, y, w, h)
//        }
//    }
    
    
//    override func collectionView(collectionView: UICollectionView,
//        viewForSupplementaryElementOfKind kind: String,
//        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//            //1
//            switch kind {
//            case UICollectionElementKindSectionHeader:
//                let headerView =
//                collectionView.dequeueReusableSupplementaryViewOfKind(kind,
//                    withReuseIdentifier: "WebHeader",
//                    forIndexPath: indexPath)
//                    as! Space3DHeaderView
//                //                headerView.label.text = searches[indexPath.section].searchTerm
//                return headerView
//            default:
//                //4
//                assert(false, "Unexpected element kind")
//            }
//    }
    
}
