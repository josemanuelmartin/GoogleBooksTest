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
        let presenter = DefaultSearchPresenter()
        let wireframe = DefaultSearchWireframe()
        let interactor = DefaultSearchInteractor()
        
        view.presenter = presenter
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        
        wireframe.viewController = view
        
        return view
    }

    
    func loadDetail(book: SearchBookModel) {
    
        let vc = DefaultDetailWireframe.createModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
