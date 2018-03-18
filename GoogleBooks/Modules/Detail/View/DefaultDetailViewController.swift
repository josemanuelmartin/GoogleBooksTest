//
//  DefaultDetailViewController.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

class DefaultDetailViewController: BaseViewController<DefaultDetailPresenter>, DetailView, UIScrollViewDelegate {
    
    @IBOutlet weak var cover: UIImageView!
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookPublicationDate: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    
    @IBOutlet weak var coverContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "detail_title".localized
        
        
        scrollViewContent.backgroundColor = .tableBackgroundoColor
        coverContentView.backgroundColor = .customGray
        bookTitle.font = .latoRegular(size: 16)
        bookAuthor.font = .latoRegular(size: 14)
        bookPublicationDate.font = .latoRegular(size: 12)
        bookDescription.font = .latoRegular(size: 12)
        
        bookTitle.textColor = .customDarkGray
        bookAuthor.textColor = .customDarkGray
        bookPublicationDate.textColor = .customGray
        bookDescription.textColor = .customGray
        
        scrollView.delegate = self
    }
    
    func updateBookDetail(model: DetailBookModel) {
        bookTitle.text = model.title ??? ""
        bookAuthor.text = model.author ??? ""
        bookPublicationDate.text = model.publicationDate ??? ""
        bookDescription.text = model.description ??? ""
        
    }
    
    func updateCover(_ imageData: Data) {
        cover.image = UIImage(data: imageData)
    }
}
