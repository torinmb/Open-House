//
//  SearchCell.swift
//  Open House
//
//  Created by blankens on 12/11/15.
//  Copyright © 2015 UW. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        searchBar.resignFirstResponder()
    }
    
}
