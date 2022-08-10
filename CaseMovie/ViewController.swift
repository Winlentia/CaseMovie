//
//  ViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 10.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
        let movieService = MovieService()
        
        movieService.getPopularMovies(pageId: 1) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }


}

