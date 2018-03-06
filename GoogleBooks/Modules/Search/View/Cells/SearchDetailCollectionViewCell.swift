//
//  SearchDetailCollectionViewCell.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

class SearchDetailCollectionViewCell: BaseCollectionViewCell<SearchBookModel> {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func setupGUI() {
        title.text = viewModel.title
        author.text = viewModel.author
    }

}
