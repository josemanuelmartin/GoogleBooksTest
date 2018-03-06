//
//  BaseCollectionViewCell.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewCell<VM: ViewModel>: UICollectionViewCell {
    var viewModel: VM! {
        didSet {
            setupGUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupGUI() {
        
    }
}
