//
//  CollectionCellFactory.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

class CollectionCellFactory {
    private let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func createCell<VM, C>(viewModel: VM, indexPath: IndexPath) -> C
        where C: BaseCollectionViewCell<VM> {
            let cell: C = collectionView.dequeueReusableCell(indexPath: indexPath)
            cell.viewModel = viewModel
            
            return cell
    }
}

