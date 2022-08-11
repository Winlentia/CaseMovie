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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        contentView.addSubview(label)
        return label
    }()
    
    lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        contentView.addSubview(imageView)
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        posterImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImage.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(viewModel: PopularMovieTableViewModel){
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        posterImage.setImage(withUrl: viewModel.imageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
