//
//  BaseViewController.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<P: Presenter>: UIViewController {
    
    var presenter: P!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGUI()
        presenter.viewDidLoad()
    }
    
    func setupGUI() {
        
    }
    
}
