//
//  DefaultSearchViewController.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

enum typeCell {
    case list
    case grid
    
    var height: CGFloat {
        switch self {
        case .list:
            return 100.0
        case .grid:
            return 100.0
        }
    }
    
    var width: CGFloat {
        switch self {
        case .list:
            return UIScreen.main.bounds.width
        case .grid:
            return height / 2
        }
    }
}

class DefaultSearchViewController: BaseViewController<DefaultSearchPresenter>, SearchView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomSearchBarDelegate {
    
    //@IBOutlet weak var headerView: DefaultCustomSearchBar!
    @IBOutlet weak var collectionsBook: UICollectionView!
    
    var factory: CollectionCellFactory!
    var currentCellType: typeCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: - Private methods
    
    private func configCollection() {
        collectionsBook.delegate = self
        collectionsBook.dataSource = self
        currentCellType = .list
        collectionsBook.register(SearchDetailCollectionViewCell.self)
    }
    
    private func setupCell(indexPath: IndexPath) -> UICollectionViewCell {
        
        let book = presenter.books[indexPath.row]
        factory = CollectionCellFactory(collectionView: collectionsBook)
        
        let cell: SearchDetailCollectionViewCell = factory.createCell(viewModel: book, indexPath: indexPath)
        return cell
    }
    
    // MARK: - CollectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupCell(indexPath:indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (currentCellType?.width)!, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.loadDetail(bookIndex: indexPath.row)
    }
    
    // MARK: - DefaultCustomSearchBar methods
    func changeDisposition() {
        currentCellType = .grid
        collectionsBook.reloadData()
    }
}
