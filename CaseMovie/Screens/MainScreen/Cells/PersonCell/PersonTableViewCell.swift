//
//  ActorTableViewCell.swift
//  CaseMovie
//
//  Created by Winlentia on 13.08.2022.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    var viewModel: PersonTableViewModel?
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .appBoldFont
        contentView.addSubview(label)
        return label
    }()
    
    lazy var popularJobsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .appMainFont
        contentView.addSubview(label)
        return label
    }()
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        mainStackView.addSubview(imageView)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        
        setupConstraints()
        
        mainStackView.addArrangedSubview(posterImageView)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(popularJobsLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
    }
    
    func configureCell(viewModel: PersonTableViewModel) {
        self.viewModel = viewModel
        self.posterImageView.setImage(withUrl: viewModel.imageUrl)
        self.titleLabel.text = viewModel.title
        self.popularJobsLabel.text = viewModel.popularJobs
    }

}
