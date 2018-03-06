//
//  DefaultCustomSearchBar.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation
import UIKit

class DefaultCustomSearchBar: BaseView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedDisposition: UISegmentedControl!
    @IBOutlet weak var segmentedFilter: UISegmentedControl!
    
    var delegate: CustomSearchBarDelegate?

    
    @IBAction func changeDisposition(_ sender: Any) {
        delegate?.changeDisposition()
    }
    
}

