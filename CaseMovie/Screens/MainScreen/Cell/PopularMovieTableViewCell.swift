//
//  PopularMovieTableViewCell.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import UIKit
import SnapKit
import Kingfisher

class PopularMovieTableViewCell: UITableViewCell {
    
    var viewModel : PopularMovieTableViewModel?
    
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
    
    lazy var releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .appMainFont
        contentView.addSubview(label)
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
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
        
        self.accessoryType = .disclosureIndicator
        
        setupConstraints()
        
        mainStackView.addArrangedSubview(posterImageView)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(releaseDate)
        descriptionStackView.addArrangedSubview(scoreLabel)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(viewModel: PopularMovieTableViewModel){
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        posterImageView.setImage(withUrl: viewModel.imageUrl)
        releaseDate.text = viewModel.releaseDate
        scoreLabel.text = viewModel.scoreLabel
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
