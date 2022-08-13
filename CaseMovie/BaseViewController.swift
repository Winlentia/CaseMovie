//
//  ViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 10.08.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Active Controller = \(String.init(describing: self))")
    }


}

