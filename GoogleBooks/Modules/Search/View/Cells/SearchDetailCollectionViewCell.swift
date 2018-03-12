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
    
    @IBOutlet weak var coverWidthConstraint: NSLayoutConstraint!
    
    override func setupGUI() {
        title.text = viewModel.title
        author.text = viewModel.author
        
        if let thumbnail = viewModel.thumbnail {
            downloadImage(url: thumbnail)
        } else {
            updateCell()
        }
        
    }
    
    private func downloadImage(url: String) {
        
        let request = GetThumbnail(urlImage: url)
        
        APIClient().getThumbnail(request) { response in
            
            switch response {
            case .success(let data):
                self.updateCell(data)
                return
            case .failure:
                self.updateCell()
                return
            }
        }
    }
    
    private func updateCell(_ imageData: Data? = nil) {
        title.text = viewModel.title
        author.text = viewModel.author
        
        if let data = imageData {
            let image = UIImage(data: data)
            coverWidthConstraint.constant = cover.frame.width
            layoutIfNeeded()
            cover.image = image
        }
    }
}
