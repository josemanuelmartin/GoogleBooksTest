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
    
    static func createModule() -> DefaultDetailViewController {
        let view = DefaultDetailViewController(nibName: "DetailView", bundle: nil)
        let presenter = DefaultDetailPresenter()
        let wireframe = DefaultDetailWireframe()
        let interactor = DefaultDetailInteractor()
        
        view.presenter = presenter
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        
        wireframe.viewController = view
        
        return view
    }
}
