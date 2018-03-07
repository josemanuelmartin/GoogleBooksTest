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

class DefaultSearchViewController: BaseViewController<DefaultSearchPresenter>, SearchView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionsBook: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedDisposition: UISegmentedControl!
    @IBOutlet weak var segmentedFilter: UISegmentedControl!
    
    var factory: CollectionCellFactory!
    var currentCellType: typeCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollection()
        configSegmentedFilters()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: - DefaultCustomSearchBar methods
    
    private func configSegmentedFilters() {
        
        segmentedDisposition.addTarget(self,
                                       action: #selector(changeDisposition),
                                       for: .valueChanged)
        
        segmentedFilter.addTarget(self,
                                  action: #selector(applyFilter),
                                  for: .valueChanged)
    }
    
    @objc func changeDisposition() {
        
        switch currentCellType! {
        case .list:
            currentCellType = .grid
        
        case .grid:
            currentCellType = .list
        }
        
        collectionsBook.reloadData()
    }
    
    @objc func applyFilter() {
//        currentCellType = .grid
//        collectionsBook.reloadData()
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
    
}
