//
//  DefaultSearchWireframe.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

class DefaultSearchWireframe: SearchWireframe {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> DefaultSearchViewController {
        let view = DefaultSearchViewController(nibName: "SearchView", bundle: nil)
        let wireframe = DefaultSearchWireframe()
        let interactor = DefaultSearchInteractor()
        let presenter = DefaultSearchPresenter(view: view, wireframe: wireframe, interactor: interactor)
        
        view.presenter = presenter
        
        wireframe.viewController = view
        
        return view
    }

    
    func loadDetail(book: SearchBookModel) {
    
        let vc = DefaultDetailWireframe.createModule(identifier: book.identifier!)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
