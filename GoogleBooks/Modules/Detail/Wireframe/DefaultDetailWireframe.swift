//
//  DefaultDetailWireframe.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

class DefaultDetailWireframe: DetailWireframe {
    
    weak var viewController: UIViewController?
    
    static func createModule(identifier: String) -> DefaultDetailViewController {
        
        let view = DefaultDetailViewController(nibName: "DetailView", bundle: nil)
        let wireframe = DefaultDetailWireframe()
        let interactor = DefaultDetailInteractor()
        let presenter = DefaultDetailPresenter(view: view, wireframe: wireframe, interactor: interactor, bookIdentifier: identifier)
        
        view.presenter = presenter
        wireframe.viewController = view
        
        return view
    }
}
