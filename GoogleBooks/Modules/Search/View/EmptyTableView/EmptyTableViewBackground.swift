//
//  EmptyTableViewBackground.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

class EmptyTableViewBackground: BaseView {

    @IBOutlet weak var emptyTitle: UILabel!
    @IBOutlet weak var emptySubtitle: UILabel!
    
    override func setupUI() {
        
        emptyTitle.text = "Empty table"
        emptySubtitle.text = "Perform a search to see results."
        
        backgroundColor = .tableBackgroundoColor
        emptyTitle.font = .latoRegular(size: 25)
        emptySubtitle.font = .latoLight(size: 15)
        
        emptyTitle.textColor = .customGray
        emptySubtitle.textColor = .customGray
        
    }
}
