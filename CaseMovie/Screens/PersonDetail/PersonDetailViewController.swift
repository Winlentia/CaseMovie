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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var detailContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .appMainFont
        return label
    }()
    
    lazy var biographyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .appMainFont
        return label
    }()
    
    lazy var imdbButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.titleLabel?.text = "IMDB Page"
        button.titleLabel?.font = .appBoldFont
        button.setTitle("IMDB Page", for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(imdbButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()

        // Do any additional setup after loading the view.
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
            make.left.right.equalTo(view)
            make.top.bottom.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(profileImage)
        
        profileImage.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.6)
        }
        
        mainStackView.addArrangedSubview(detailContainerView)
        
        detailContainerView.addSubview(detailStackView)
        detailContainerView.snp.makeConstraints { make in
            make.width.equalTo(view)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.addArrangedSubview(subTitleLabel)
        detailStackView.addArrangedSubview(biographyLabel)
        detailStackView.addArrangedSubview(imdbButton)
        imdbButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    fileprivate func bindViewModel() {
        viewModel.updateUI = { [weak self] in
            guard let self = self else { return }
            self.title = self.viewModel.navigationTitle
            self.subTitleLabel.text = self.viewModel.subTitle
            self.profileImage.setImage(withUrl: self.viewModel.profileImageUrl)
            self.titleLabel.text = self.viewModel.title
            self.biographyLabel.text = self.viewModel.biography
            
            self.imdbButton.isHidden = self.viewModel.isImdbButtonHidden
        }
    }

    @objc fileprivate func imdbButtonAction(){
        if let imdbUrl = viewModel.imdbUrl,let url = URL(string: imdbUrl) {
            UIApplication.shared.open(url)
        }
    }
    
}
