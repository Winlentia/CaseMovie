//
//  PopularMovieTableViewCell.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import UIKit
import SnapKit

class PopularMovieTableViewCell: UITableViewCell {
    
    var viewModel : PopularMovieTableViewModel?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(viewModel: PopularMovieTableViewModel){
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
