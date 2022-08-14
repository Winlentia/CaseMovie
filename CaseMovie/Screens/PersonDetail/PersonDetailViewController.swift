//
//  PersonDetailViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 14.08.2022.
//

import UIKit

class PersonDetailViewController: BaseViewController {
    
    let viewModel: PersonDetailViewModel
    
    init(viewModel: PersonDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }

}
