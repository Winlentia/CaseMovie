//
//  MovieDetailViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 12.08.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    let viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .appBoldFont
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
        bindViewModel()
        

    }
    
    fileprivate func setupUI() {
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStackView.insertArrangedSubview(posterImageView, at: 0)
        
        posterImageView.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.6)
        }
        
        mainStackView.insertArrangedSubview(titleLabel, at: 1)
        
        
    }
    
    fileprivate func bindViewModel() {
        viewModel.updateUI = { [weak self] in
            guard let self = self else { return }
            self.title = self.viewModel.navigationTitle
            self.posterImageView.setImage(withUrl: self.viewModel.imageUrl)
            self.titleLabel.text = self.viewModel.title
        }
    }

}
