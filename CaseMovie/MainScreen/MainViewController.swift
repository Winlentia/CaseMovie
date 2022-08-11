//
//  MainViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var viewModel = MainViewModel(movieService: MovieService())
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search Movie or Actorstruct"
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .blue
        tableView.registerCell(type: PopularMovieTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
        view.backgroundColor = .yellow
        configureUI()
        bindViewModel()
        viewModel.fetchMovies()
    }
    
    func configureUI() {
        setupTableView()
        
        setupSearchBar()
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.isHidden = false
    }
    
    fileprivate func bindViewModel() {
        viewModel.reloadCompletion = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.popularMovieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: PopularMovieTableViewCell.self, for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(viewModel: .init(movie: viewModel.popularMovieData[indexPath.row]))
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

